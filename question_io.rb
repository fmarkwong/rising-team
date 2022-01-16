require 'io/console'

class QuestionIO
  def self.print_question(question)
    puts
    puts "My questions is:"
    puts "====================="
    puts question
    puts
  end

  def self.get_user_input
    STDIN.getch
  end
end
