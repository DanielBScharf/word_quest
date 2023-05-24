class MonstersController < ApplicationController
  def show
    @monster = Monster.find(params[:id])
    # creates a question so we can generate the question when the monster is called
    @character = Character.find_by(user_id: current_user.id)
    @question = Question.new
    @question.monster = @monster
    @question.category = @monster.category
    # @monster = Monster.find(params[:monster_id])
    # @question.level = @character.level
    @question.ai_question = OpenaiService.new("give me a multiple choice English CEFR A1 #{@question.category} question with answers as an array, do not use the answer in the question, do not ask questions including other languages other than English, have only one correct answer").call
    @question.text = @question.ai_question.match(/(\w*\s*)*\?/)

    # @question.save

    # @ai_answers = @question.ai_question.scan(/([a-d]\))\s*(.+)/).map { |option| option.join("\n") }

    # @correct_answer = @question.ai_question.match(/Answer:\n(.+)/)&.captures&.first

    # @answer_a = Answer.new(text: @ai_answers[0], correct: @answer_a == @correct_answer, question: @question)
    # @answer_a.save

    # @answer_b = Answer.new(text: @ai_answers[1], correct: @answer_b == @correct_answer, question: @question)
    # @answer_b.save

    # @answer_c = Answer.new(text: @ai_answers[2], correct: @answer_c == @correct_answer, question: @question)
    # @answer_c.save

    # @answer_d = Answer.new(text: @ai_answers[3], correct: @answer_d == @correct_answer, question: @question)
    # @answer_d.save
    # pass the question to the next page (question/show) through the params
  end
end
