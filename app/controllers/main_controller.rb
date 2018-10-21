class MainController < ApplicationController
  def new
    @user = session[:user_id]
  end
end
