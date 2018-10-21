class SessionController < ApplicationController
  def new;end
  
  def login
    user = User.find_by username: params[:session][:username].downcase
    if user
      if user.username == "admin" && user === user.authenticate(params[:session][:password]) 
        log_admin
        session[:username]= user.username
        redirect_to users_path
      elsif user === user.authenticate(params[:session][:password])
        if user.is_active.to_s == "true"
          log_in user
          redirect_to user
        elsif user.is_active.to_s == "false"
          flash.now[:danger]="Your accout has been banned ! Contact with admin to unlock"
          render :new
        end
      else
        flash.now[:danger]= "Username or password invalid! Please try again!!!"
        render :new
      end
    else
      flash.now[:danger]= "Username does not exist! Register new one"
      render :new
    end
  end

  def logout
    log_out
  end
  
  def recover;end

  def reset
    if params[:session]
       user = User.find_by email: params[:session][:email]
       if user
      flash.now[:success]="Success"
      render :recover
    else
      flash.now[:danger]="No email was found!"
      render :recover
    end
   end
  end

end
