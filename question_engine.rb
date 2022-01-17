require "timeout"
require_relative "question_io"

class QuestionEngine
  QUESTION_INTERVAL_SECONDS = 1

  def initialize(questions)
    @questions = questions
  end

  def ask_next_question
    QuestionIO.print_question(@questions.get_next)
  end

  def ask_many_questions
    input = nil

    while input.nil? do
      ask_next_question
      QuestionIO.print "\nPress any key to stop\n\n"

      begin 
        Timeout::timeout QUESTION_INTERVAL_SECONDS do
          input = QuestionIO.get_user_input 
        end
      rescue Timeout::Error
      end
    end
  end
end
