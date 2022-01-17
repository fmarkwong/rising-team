require "timeout"
require_relative "question_io"
require_relative "question_data"
require_relative "question_engine"

def print_prompt
  puts "What would you like Magic Hat to do?"
  puts "a: Ask one question"
  puts "b: Ask many questions"
  puts "c: Quit"
end

question_engine = QuestionEngine.new(QuestionData.new)

#main loop
loop do
  print_prompt

  case QuestionIO.get_user_input
  when 'a' then question_engine.ask_next_question
  when 'b' then question_engine.ask_many_questions
  when 'c', "\u0003" then exit(1) # c or ctrl-c
  else
    puts "\nPlease enter 'a', 'b', or 'c'" 
  end
end

