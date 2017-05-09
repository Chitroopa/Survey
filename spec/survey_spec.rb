require('spec_helper')

describe(Survey) do
  describe("#questions") do
    it("tells what questions are in the survey") do
      test_survey = Survey.create({:name => "What is your favorite color"})
      test_question1 = Question.create({:question => "What color do you want your kitchen?", :survey_id => test_survey.id})
      test_question2 = Question.create({:question => "What color do you want your car?", :survey_id => test_survey.id})
      expect(test_survey.questions()).to eq([test_question1, test_question2])
    end
  end
end
