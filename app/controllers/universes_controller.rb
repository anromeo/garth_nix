class UniversesController < ApplicationController
  def index
  end

  def old_kingdom
  end

  def the_house
  end

  def aenir
  end

  def trouble_twisters
  end

  def new
  end

  def create
  end

  private

  def universe_params
    params.require(:universe).permit(:title, :description)
  end
end
