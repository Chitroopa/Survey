class CreateSurveyQuestionAnswer < ActiveRecord::Migration[5.1]
  def change
    create_table(:surveys) do |t|
      t.column(:name, :string)

      t.timestamps()
    end
    create_table(:questions) do |t|
      t.column(:question, :string)
      # type is checkbox, select, radio
      t.column(:type, :string)
      t.column(:survey_id, :int)
      t.timestamps()
    end
    create_table(:answers) do |t|
      t.column(:answer, :string)
      t.column(:question_id, :int)

      t.timestamps()
    end
  end
end
