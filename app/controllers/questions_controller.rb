class QuestionsController < ApplicationController
  before_action :set_character, only: %i[show_battle openapi]
  before_action :set_monster, only: %i[openapi]

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
    @character = current_user.current_character
    @show_health = @character.current_health / 10

    # creates a question so we can generate the question when the monster is called
    @monster = Monster.find_by(id: params[:monster_id]) || Monster.find_by(id: params[:id])
    # todo change to unanswered ones
    @question =  Question.all.sample
    # @question =  Question.where(monster: @monster).where.not(id: @character.questions).sample
    # TODO: this route is not right
    redirect_to show_village_character_maps_path(@character) unless @question
    @choices = @question.answers

    # response = openapi
    # @question = Question.new(monster: @monster, category: @monster.category, text: response["question"], ai_question: response["answer"])

    # the above can be called by the battle controller that will then break the response apart, etc
    # @choices = response["choices"]
    # @question.save
    # @choices = answers(@choices, response["answer"])
  end

  private

  def openapi
    prompt = 'Respond in JSON form and include no other commentary, JSON object should be as follows {"question": "", "answer": "", "choices": [] } . Give me a CEFR A' + @character.level.to_s + ' ' + @character.language + ' ' + @monster.category + ' question with four multiple choices. The choices cannot be synonyms of each other and only one of the multiple choices is the correct answer.'
    OpenaiService.new(prompt).call
  end

  def answers(choices, answer)
    choices.map.each do |choice|
      Answer.create(text: choice, correct: answer.match?(choice), question_id: @question.id)
    end
  end

  def set_character
    @character = current_user.current_character
  end

  def set_monster
    if params[:format]
      @monster = Monster.find(params[:format])
    else
      @monster = Monster.find(params[:monster_id])
    end
  end
end
