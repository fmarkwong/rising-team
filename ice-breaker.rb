require "timeout"
require 'io/console'
require_relative "question_data"

def ask_a_question(question)
  puts
  puts "My questions is:"
  puts "====================="
  puts question
  puts
end

def ask_many_questions(questions)
  input = ""
  loop do
    ask_a_question(questions.get_next)
    puts "Press any key to stop"

    begin 
      Timeout::timeout 1 do
        input = STDIN.getch
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
  input = STDIN.getch

  if input == 'a' 
    ask_a_question(questions.get_next)
  elsif input == 'b'
    ask_many_questions(questions)
  elsif input == 'c' || input == "\u0003"
    exit(1)
  else
    puts
    puts "Please enter 'a', 'b', or 'c'" 
  end
end

