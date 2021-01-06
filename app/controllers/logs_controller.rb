class LogsController < ApplicationController
  def index
    @logs = current_user.logs.all
  end
  def new
    @log = Log.new
  end

  def create
    @log = current_user.logs.build(grnv_id: params[:grnvId])
    if @log.save
      redirect_to logs_path
    else
      render :json => { msg: "fail" }
    end
  end
end
