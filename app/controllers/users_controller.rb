class UsersController < ApplicationController
  def create
    line_user_id = params[:userId]
    success_msg = { msg: "login" }
    false_msg = { msg: "create" }
    if user_find?(line_user_id)
      login(line_user_id) if !logged_in?
      render :json => success_msg
    else
      create_user(line_user_id)
      login(line_user_id)
      render :json => false_msg
    end
  end

  private

  def user_find?(line_user_id)
    user = User.find_by(user_id: line_user_id)
    return true if user
    false
  end

  def create_user(line_user_id)
    user = User.new(user_id: line_user_id)
    user.save if user.valid?
  end


  def login(line_user_id)
    user = User.find_by(user_id: line_user_id)
    session[:user_id] = user.id if user
  end

  def log_out
   session.delete(:user_id)
   @current_user = nil
  end

  def logged_in?
   !current_user.nil?
  end
end
