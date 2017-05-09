require('pry')
require('launchy')
require('pg')
require('sinatra')
require('sinatra/reloader')
require('sinatra/activerecord')
require('rake')
require('./lib/survey')
require('./lib/question')
require('./lib/answer')
also_reload('./**/*.rb')

ENV['RACK_ENV'] = 'test'

get('/') do
  erb(:index)
end

get('/survey_designer') do
  @surveys = Survey.all()
  erb(:survey_designer)
end

post('/survey_designer/new') do
  name = params.fetch('name')
  new_survey = Survey.create({:name => name})
  @surveys = Survey.all()
  erb(:survey_designer)
end

get('/survey_designer/:id') do
  id = params.fetch('id')
  @survey = Survey.find(id)
  @questions = Question.all()
  erb(:survey_questions)
end

post('/survey_designer/question/:id') do
  id = params.fetch('id')
  @survey = Survey.find(id)
  question = params.fetch('question')
  question_type = params.fetch('question_type')
  @survey.questions.new({:question => question, :question_type => question_type})
  @survey.save()
  @questions = Question.all()
  erb(:survey_questions)
end

get ('/survey_designer/answer/:id') do
  id = params.fetch('id')
  @question = Question.find(id)
  @answers = Answer.all()
# binding.pry
  erb(:question_answers)
end

delete ('/survey_designer/answer/:id') do
  id = params.fetch('id')
  @question = Question.find(id)
  @question.delete()
  @questions = Question.all()
  @survey = @question.survey
  erb(:survey_questions)
end

post ('/survey_designer/answer/:id') do
  id = params.fetch('id')
  @question = Question.find(id)
  answer = params.fetch('answer')
  @question.answers.new({:answer =>answer})
  @question.save()
  @answers = Answer.all()
  erb(:question_answers)
end

post ('/survey_designer/question/rename/:id') do
  id = params.fetch('id')
  @question = Question.find(id)

  erb(:question_rename)
end

patch ('/survey_designer/question/rename/:id') do
  id = params.fetch('id')
  question = params.fetch('question')
  @question = Question.find(id)
  @question.update({:question => question})
  erb(:question_answers)
end
