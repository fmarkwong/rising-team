require 'minitest/autorun'
require_relative '../question_data'

class TestQuestionData < MiniTest::Unit::TestCase
  TEST_DATA_SOURCE = [
    'question1',
    'question2',
    'question3',
    'question4',
    'question5',
  ]

  def setup
    @question_data = QuestionData.new(TEST_DATA_SOURCE)
  end

  def test_get_next_gets_a_question
    question = @question_data.get_next

    assert TEST_DATA_SOURCE.include? question 
  end

  def test_get_next_reinitializes_when_retrieved_last_question
    (TEST_DATA_SOURCE.size + 1).times do
      @question = @question_data.get_next
    end

    assert TEST_DATA_SOURCE.include? @question 
  end

  def test_get_next_does_not_repeat_same_question
    questions_asked = []
    questions_asked << @question_data.get_next

    (TEST_DATA_SOURCE.size - 1).times do
      new_question = @question_data.get_next
      assert !(questions_asked.include? new_question)
      questions_asked << new_question 
    end
  end

end
