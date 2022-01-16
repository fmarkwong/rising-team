require "timeout"
require 'io/console'

def ask_a_question(question)
  puts
  puts "My questions is:"
  puts "====================="
  puts question
  puts
end


def randomize_questions(questions)
  questions.shuffle
end


def ask_many_questions(questions)
  input = ""
  loop do
    questions = randomize_questions(QUESTIONS) if questions.empty?
    ask_a_question(questions.pop)
    puts "Press any key to stop"

    begin 
      Timeout::timeout 2 do
        input = STDIN.getch
      end
    rescue Timeout::Error
      input = "none"
    end
    break if input != "none" 
  end
end


QUESTIONS = (1..4).to_a
QUESTIONS_BACKUP = [ 
  "What’s the best thing you’ve got going on in your life at the moment?",
  "What incredibly common thing have you never done?",
  "What has taken you the longest to get good or decent at?",
  "What food do you love that a lot of people might find a little odd?",
  "If you could start a charity, what would it be for?",
  "What was the funniest thing you’ve seen recently online?",
  "What are some of your favorite games to play?",
  "What takes a lot of time but is totally worth it?",
  "What is the most amazing fact you know?",
  "What website or app doesn’t exist, but you really wish it did?",
  "What’s your favorite type of day? (weather, temp, etc.)",
  "What is the most clever or funniest use of advertising you’ve seen?",
  "How into self-improvement are you?",
  "When someone finds out what you do, or where you are from, what question do they always ask you?",
  "Are you more productive at night or in the morning? Do you think it’s possible to change and get used to another schedule?",
  "What scene in a movie always gives you goosebumps every time you watch it?",
  "What topic could you give a 20-minute presentation on without any preparation?",
  "What’s something that a lot of people are missing out on because they don’t know about it?",
  "What are some of your guilty pleasures?",
  "Who is the most interesting person you’ve met and talked with?",
]

questions = randomize_questions(QUESTIONS)

loop do
  questions = randomize_questions(QUESTIONS) if questions.empty?

  puts
  puts "What would you like Magic Hat to do?"
  puts "a: Ask one question"
  puts "b: Ask many questions"
  puts "c: Quit"
  input = STDIN.getch

  if input == 'a' 
    question = questions.pop
    ask_a_question(question)
  elsif input == 'b'
    ask_many_questions(questions)
  elsif input == 'c' || input == "\u0003"
    exit(1)
  else
    puts
    puts "Please enter 'a', 'b', or 'c'" 
  end
end

