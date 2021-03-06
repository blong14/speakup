class IdeasController < ApplicationController

    before_action :require_login

    def create
        @idea = Idea.new(idea_params)
        @idea.save
        redirect_to @idea
    end

    def index
        @ideas = Idea.left_joins(:votes).group(:id).order(Arel.sql('COUNT(votes.id) DESC'))
    end

    def show
        @idea = Idea.find(params[:id])
    end

    private
        def idea_params
            params.require(:idea).permit(:title, :description)
        end


end
