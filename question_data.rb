class QuestionData
  def initialize(data)
    @original_data = data
    @questions = data.shuffle
  end

  def get_next
    @questions = @original_data.shuffle if @questions.empty?
    @questions.pop
  end
end
