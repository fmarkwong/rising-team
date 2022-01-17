class QuestionData
  def initialize(question_data)
    @original_data = question_data
    @original_data.freeze
    @questions_stack = @original_data.shuffle
  end

  def get_next
    @questions_stack = @original_data.shuffle if @questions_stack.empty?
    @questions_stack.pop
  end
end
