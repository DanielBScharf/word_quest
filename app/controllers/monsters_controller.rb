class MonstersController < ApplicationController
  def show
    @monster = Monster.find(params[:id])

    # creates a question so we can generate the question when the monster is called
    @character = Character.find_by(user_id: current_user.id)
    @question = Question.new
    @question.monster = @monster

    @question.category = @monster.category
    response = openapi.split(',', 3)
    @question.text = response[0].tr('"', '')
    @choices = response[2].tr('/([|]|")/', '').split(',')
    @answer = response[1].tr('"', '')

  end

  private

  def openapi
    prompt = 'Respond in JSON form and include no other commentary, JSON object should be as follows {Question: "", Answer: "", Choices: [] } . Give me a CEFR B2 English vocabulary question with four multiple choices.'
    OpenaiService.new(prompt).call
  end
end
