class QuestionsController < ApplicationController
  response = OpenaiService.new('whatever you want to ask it').call

    def new
      @question = Question.new
      @language = current_user.character.lanuage
      @type = Map.find(params.id).monster_id
    end
    def create

    end
end
