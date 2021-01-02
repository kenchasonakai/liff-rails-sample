class UsersController < ApplicationController
  def create
    user = ActiveUser.new(id: params[:userId], name: params[:displayName])
    success_msg = { msg: "success" }
    false_msg = { msg: "false" }
    if user.valid?
      session[:user_id] = user.id if session[:user_id] != user.id
      render :json => success_msg
    else
      render :json => false_msg
    end
  end
end
