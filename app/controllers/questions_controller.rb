class QuestionsController < ApplicationController

  def index
    @error_messages = flash[:notice]
    @question = Question.new
  end

  def create
    @question = Question.new(params[:question])
    if @question.save
      flash[:notice] = "Your question has been asked. Stay tuned for an answer."
    else
      flash[:notice] = "There was a problem. Please, try again later."
    end
    render action: "index"
  end
end
