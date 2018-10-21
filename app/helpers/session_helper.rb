module SessionHelper
    def log_in(user)
      session[:user_id]=user.id 
    end
    
    def log_admin
      session[:user_id] = User.find_by(username:'admin').id
      @user = User.find_by(id: session[:user_id])
      return 1
    end

    def current_user
      if session[:user_id]
        @user ||= User.find(session[:user_id])
        return 1
      else 
        return 0
      end
    end

    def log_out
      if session[:user_id]
        session.delete :user_id
        session[:user_id] = nil
        render :new
      end
    end
end
