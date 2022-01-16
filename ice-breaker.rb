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

def print_prompt
  puts "\nWhat would you like Magic Hat to do?"
  puts "a: Ask one question"
  puts "b: Ask many questions"
  puts "c: Quit"
end

#main loop
questions = QuestionData.new

loop do
  print_prompt

  case QuestionIO.get_user_input
  when 'a' then ask_next_question(questions)
  when 'b' then ask_many_questions(questions)
  when 'c', "\u0003" then exit(1)
  else
    puts "\nPlease enter 'a', 'b', or 'c'" 
  end
end

