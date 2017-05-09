require('spec_helper')

describe(Question) do
  describe("#answers") do
    it("tells what answers are in the question") do
      test_question = Question.create({:question => "What color do you want your car?", :question_type => "radio"})
      test_answer1 = Answer.create({:answer => "red", :question_id => test_question.id})
      test_answer2 = Answer.create({:answer => "blue", :question_id => test_question.id})
      expect(test_question.answers()).to eq([test_answer1, test_answer2])
    end
  end

  describe("#survey") do
    it("tells what survey the question belong to") do
      test_survey = Survey.create({:name => "What is your favorite color"})
      test_question1 = Question.create({:question => "What color do you want your kitchen?", :survey_id => test_survey.id})
      expect(test_question1.survey()).to eq(test_survey)
    end
  end
end
