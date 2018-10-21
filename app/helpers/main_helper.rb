module MainHelper
    def check_session
     if session[:user_id]
        return 1
     else
        return 0
     end
    end
end
