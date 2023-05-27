class QuestionsController < ApplicationController

  def index
    # TODO:
  end

  def show
    @monster = Monster.all.first
    @question = Question.all.sample
    @character_answer = CharacterAnswer.new
    @current_character = Character.find(current_user.current_character_id)
    @answers = Answer.where(question_id: @question.id)
    @correct = @answers.find { |answer| answer.correct == true }
  end

  def new
    @question = Question.new
  end

  def create
    # TODO: shortened or fixed
    @monster = Monster.all.first
    # creates a question so we can generate the question when the monster is called
    @character = Character.find_by(user_id: current_user)
    @question = Question.new
    @question.monster = @monster
    @question.category = @monster.category
    p response = openapi.split(',', 3)
    # the above can be called by the battle controller that will then break the response apart, etc
    @question.text = @response[0].tr('"', '')
    @choices = response[2].tr('/([|]|")/', '').split(',')
    @answer = response[1].tr('"', '')
    @question.save
    @choices = @choices.map.each do |answer|
      answer = Answer.new(text: answer.strip, correct: @answer.match?(answer.strip), question_id: @question.id)
      answer.save
    end
     @choices
  end

  def show_battle
    @monster = Monster.all.first
    # creates a question so we can generate the question when the monster is called
    @character = Character.find_by(user_id: current_user)
    @question = Question.new(monster: @monster, category: @monster.category )
    # @question.monster = @monster
    # @question.category = @monster.category
    response = openapi # .split(',')
    # the above can be called by the battle controller that will then break the response apart, etc
    @question.text = response["question"]
    @choices = response["choices"]
    @answer = response["answer"]
    @question.save
    @choices = answers(@choices)
  end

  private

  def openapi
    prompt = 'Respond in JSON form and include no other commentary, JSON object should be as follows {"question": "", "answer": "", "choices": [] } . Give me a CEFR B2 English vocabulary question with four multiple choices. None of the choices can be synonyms of each other. Ensure one of the multiple choices is the correct answer and none of the others are.'
    OpenaiService.new(prompt).call
  end

  def answers(choices)
    choices.map.each do |answer|
      Answer.create(text: answer.strip, correct: @answer.match?(answer.strip), question_id: @question.id)
    end
  end
end
