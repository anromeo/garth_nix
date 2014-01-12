class QuestionsController < ApplicationController

  def index
    @error_messages = flash[:notice]
    @question = Question.new
    @questions = Question.all
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      flash[:notice] = "Your question has been asked. Stay tuned for an answer."
    else
      flash[:notice] = "There was a problem. Please, try again later."
    end
    render action: "thanks"
  end

  def thanks
  end

  private

  def question_params
    params.require(:question).permit(:name, :q, :email)
  end
end
