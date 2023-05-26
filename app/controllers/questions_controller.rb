class QuestionsController < ApplicationController

  def new
    @question = Question.new
  end

  def create
    @question = Question.new
    # @character = Character.find_by(user_id: current_user.id)
    # @monster = Monster.find(params[:monster_id])
    # # @question.level = @character.level
    # @question.ai_question = OpenaiService.new("give me an English CEFR A1 #{@monster.category} question with four choices and answers as an array").call
    # @question = @question.ai_question.match(/Question:\n(.+)(?=\na\))/)&.captures&.first
    @question.save
  end

  def show
    @monster = Monster.all.first
    @question = Question.all.sample
    @character_answer = CharacterAnswer.new
    @current_character = Character.find(current_user.current_character_id)
    @answers = Answer.where(question_id: @question.id)
    @correct = @answers.find { |answer| answer.correct == true }
  end

  def show_battle
    @monster = Monster.find(1)

    # creates a question so we can generate the question when the monster is called
    @character = Character.find_by(user_id: current_user)
    @question = Question.new
    @question.monster = @monster
    @question.category = @monster.category
    response = openapi.split(',', 3)
    @question.text = response[0].tr('"', '')
    @choices = response[2].tr('/([|]|")/', '').split(',')
    @answer = response[1].tr('"', '')
    @question.save
    @choices = @choices.map.each do |answer|
      answer = Answer.new(text: answer.strip, correct: @answer.match?(answer.strip), question_id: @question.id)
      answer.save
      answer
    end
     @choices
  end

  private

  def openapi
    prompt = 'Respond in JSON form and include no other commentary, JSON object should be as follows {Question: "", Answer: "", Choices: [] } . Give me a CEFR B2 English vocabulary question with four multiple choices.'
    OpenaiService.new(prompt).call
  end
end
