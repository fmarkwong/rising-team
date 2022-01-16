class QuestionData
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

  def initialize
    @questions = QUESTIONS.shuffle
  end

  def get_next
    initialize if @questions.empty?
    @questions.pop
  end
end
