require_relative "question_io"

class QuestionEngine
  def self.ask_next_question(questions)
    QuestionIO.print_question(questions.get_next)
  end

  def self.ask_many_questions(questions)
    input = ''

    while input.empty? do
      ask_next_question(questions)
      puts "Press any key to stop"

      begin 
        Timeout::timeout 1 do
          input = QuestionIO.get_user_input 
        end
      rescue Timeout::Error
      end
    end
  end
end
