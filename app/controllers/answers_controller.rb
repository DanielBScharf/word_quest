class AnswersController < ApplicationController
  def new
    @answer = Answer.new
  end

  def create
    @ai_answers = # need regex for answewrs OpenaiService.new("give me a #{@level} #{@type} question with answer").call
    @question = Question.find(params[:id])
    @correct_answer = #need regex for correct answer

    @answer_a = Answer.new(text: @ai_answers[0], correct: @answer_a == @correct_answer, question: @question)
    @answer_a.save

    @answer_b = Answer.new(text: @ai_answers[1], correct: @answer_b == @correct_answer, question: @question)
    @answer_b.save

    @answer_c = Answer.new(text: @ai_answers[2], correct: @answer_c == @correct_answer, question: @question)
    @answer_c.save

    @answer_d = Answer.new(text: @ai_answers[3], correct: @answer_d == @correct_answer, question: @question)
    @answer_d.save
  end

end
