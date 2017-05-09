require('spec_helper')

describe(Answer) do
  describe("#question") do
    it("tells what question it belong to") do
      test_question = Question.create({:question => "What color do you want your car?", :question_type => "radio"})
      test_answer = Answer.create({:answer => "red", :question_id => test_question.id})
      expect(test_answer.question()).to eq(test_question)
    end
  end
end
