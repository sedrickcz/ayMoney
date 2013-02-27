class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :init

  def init
    @cash_flow = CashFlow.new
    @cash_flows = CashFlow.order(:date).limit(10)
    @accounts = Account.order(:title)
    @categories = Category.order(:title)
  end
end
