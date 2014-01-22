class HomeController < ApplicationController

  def index
    
  end

  def email
    if Contact.email_garth(params[:name], params[:email], params[:message]).deliver
      redirect_to thanks_path
    else
    end
  end
end