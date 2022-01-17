require 'io/console'

# might be good to implement this as an interface class 
# for child classes to implement e.g. a version for commandline
# and one for web.
class QuestionIO
  def self.print(text)
    puts text
  end

  def self.print_question(question)
    puts "My question is:"
    puts "==============="
    puts question
  end

  def self.get_user_input
    STDIN.getch
  end
end
