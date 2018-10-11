module SessionsHelper
   def current_user
   end

  def logged_in?
    !!current_user
  end
end
