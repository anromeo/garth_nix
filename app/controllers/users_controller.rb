class UsersController < ApplicationController
  before_filter :authenticate_user!

  def index
    @questions = Question.where(a: nil)
  end

end