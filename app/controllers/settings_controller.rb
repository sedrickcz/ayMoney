class SettingsController < ApplicationController
  def index
    @settings = Setting.all
  end

  def update_all
    flash[:notice] = "Settings updated successfully" if Setting.update_all(params[:settings])
    redirect_to :back
  end
end