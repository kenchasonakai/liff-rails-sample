class LogsController < ApplicationController
  def new
    @log = Log.new
  end

  def create
    @log = current_user.logs.build(grnv_id: params[:grnvId])
    if @log.save
      render :json => { msg: "success" }
    else
      render :json => { msg: "fail" }
    end
  end
end
