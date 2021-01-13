class LogsController < ApplicationController
  def index
    @logs = Log.where(user_id: current_user.id).select("logs.drank_on").distinct
  end
  def new
    @log = Log.new
  end

  def create
    drank_on = (DateTime.now - 10.hour).to_date
    grnv_bar_info = GrnvBarInfo.find_by(grnv_id: params[:grnvId])
    new_grnv_bar_info = GrnvBarInfo.new(grnv_id: params[:grnvId], address: params[:grnvAddress], name: params[:name], image: params[:image], grnv_url: params[:grnvUrl], tel: params[:grnvTel], opentime: params[:grnvOpentime], holiday: params[:grnvHoliday])

    @grnv_bar_info = grnv_bar_info ? grnv_bar_info : new_grnv_bar_info
    @grnv_bar_info.save if !grnv_bar_info
    @log = current_user.logs.build(grnv_bar_info_id: @grnv_bar_info.id, drank_on: drank_on)
    @log.save if @log.valid?
  end

  def muni
    code = params[:muniCd]
    address = params[:lv01Nm]
    muni = Muni.find_by(muni_cd: code)
    msg = "#{muni.muni_name}#{address}"
    puts msg
    render :json => { msg: msg }
  end
  def shops
    date = params[:date]
    @shops = Log.where(user_id: current_user.id, drank_on: date)
  end
end
