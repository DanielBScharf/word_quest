class QuestionsController < ApplicationController
  before_action :set_character, only: %i[show_battle openapi]
  before_action :set_monster, only: %i[openapi show_battle]

  def index
    # TODO:
  end

  def show
    # @monster = Monster.all.first
    # @question = Question.all.sample
    # @character_answer = CharacterAnswer.new
    # @current_character = Character.find(current_user.current_character_id)
    # @answers = Answer.where(question_id: @question.id)
    # @correct = @answers.find { |answer| answer.correct == true }
  end

  def new
    # @question = Question.new
  end

  def create
  end

  def show_battle

    # creates a question so we can generate the question when the monster is called
    # @character = Character.find_by(user_id: current_user)
    set_monster

    @question = Question.new(monster: @monster, category: @monster.category)
    response = openapi
    # the above can be called by the battle controller that will then break the response apart, etc
    @question.text = response["question"]
    @choices = response["choices"]
    p @answer = response["answer"]
    @question.save
    @choices = answers(@choices)
    @choices.each do |choice|
      choice.correct == true ? @correct_answer = choice : false
    end
    @question.ai_question = @correct_answer.text
    @question.save

  end

  private

  def openapi
    prompt = 'Respond in JSON form and include no other commentary, JSON object should be as follows {"question": "", "answer": "", "choices": [] } . Give me a CEFR A' + @character.level.to_s + ' ' + @character.language + ' ' + @monster.category + ' question with four multiple choices. The choices cannot be synonyms of each other and only one of the multiple choices is the correct answer.'
    OpenaiService.new(prompt).call
  end

  def answers(choices)
    choices.map.each do |choice|
      Answer.create(text: choice, correct: @answer.match?(choice), question_id: @question.id)
    end
  end

  def set_character
    @character = Character.find(params[:character_id])
  end

  def set_monster
    @monster = Monster.find(params[:format])
  end
end
