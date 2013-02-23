class DashboardController < ApplicationController
  def index
    @cash_flow = CashFlow.new
    @cash_flows = CashFlow.order(:date).limit(10)
    @accounts = Account.order(:title)
    @categories = Category.order(:title)
  end
end
