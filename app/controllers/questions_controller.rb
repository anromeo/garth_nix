class QuestionsController < ApplicationController
  before_action :authenticate_user!, only: :edit
  before_action :set_question, only: [:edit, :update]

  def index
    @error_messages = flash[:notice]
    @question = Question.new
    @questions = Question.where("a is not null")
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

  def edit
  end

  def update
    respond_to do |format|
      if @question.update_attributes(question_params)
        format.html {redirect_to questions_path, notice: "You've answered this question"}
      else
        format.html {render action: "update", alert: "There was a problem, and the question wasn't answered."}
      end
    end
  end

  private

  def set_question
    @question = Question.find(params[:id])
  end
  def question_params
    params.require(:question).permit(:name, :q, :email, :a)
  end
end
