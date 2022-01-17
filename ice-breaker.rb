require_relative "question_io"
require_relative "question_data"
require_relative "question_engine"

question_data = QuestionData.new(File.readlines('questions_data.txt')) 
question_engine = QuestionEngine.new(question_data)

#main loop
loop do
  puts "What would you like Magic Hat to do?"
  puts "a: Ask one question"
  puts "b: Ask many questions"
  puts "c: Quit\n\n"

  case QuestionIO.get_user_input
  when 'a' then question_engine.ask_next_question
  when 'b' then question_engine.ask_many_questions
  when 'c', "\u0003" then exit(1) # c or ctrl-c
  else
    puts "Please enter 'a', 'b', or 'c'\n" 
  end
end

