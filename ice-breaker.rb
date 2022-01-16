require "timeout"
require_relative "question_data"
require_relative "question_io"


def ask_next_question(questions)
  QuestionIO.print_question(questions.get_next)
end

def ask_many_questions(questions)
  input = ""
  loop do
    ask_next_question(questions)
    puts "Press any key to stop"

    begin 
      Timeout::timeout 1 do
        input = QuestionIO.get_user_input 
      end
    rescue Timeout::Error
      input = "none"
    end
    break if input != "none" 
  end
end

questions = QuestionData.new

loop do
  puts
  puts "What would you like Magic Hat to do?"
  puts "a: Ask one question"
  puts "b: Ask many questions"
  puts "c: Quit"

  input = QuestionIO.get_user_input 

  if input == 'a' 
    ask_next_question(questions)
  elsif input == 'b'
    ask_many_questions(questions)
  elsif input == 'c' || input == "\u0003" # ctrl C
    exit(1)
  else
    puts
    puts "Please enter 'a', 'b', or 'c'" 
  end
end

