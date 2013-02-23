class CashFlowsController < ApplicationController
  # GET /cash_flows
  # GET /cash_flows.json
  def index
    @cash_flows = CashFlow.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @cash_flows }
    end
  end

  # GET /cash_flows/1
  # GET /cash_flows/1.json
  def show
    @cash_flow = CashFlow.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @cash_flow }
    end
  end

  # GET /cash_flows/new
  # GET /cash_flows/new.json
  def new
    @cash_flow = CashFlow.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @cash_flow }
    end
  end

  # GET /cash_flows/1/edit
  def edit
    @cash_flow = CashFlow.find(params[:id])
  end

  # POST /cash_flows
  # POST /cash_flows.json
  def create
    @cash_flow = CashFlow.new(params[:cash_flow])

    respond_to do |format|
      if @cash_flow.save
        format.html { redirect_to root_path, notice: 'Cash flow was successfully created.' }
      else
        format.html { render action: "new" }
        format.json { render json: @cash_flow.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /cash_flows/1
  # PUT /cash_flows/1.json
  def update
    @cash_flow = CashFlow.find(params[:id])

    respond_to do |format|
      if @cash_flow.update_attributes(params[:cash_flow])
        format.html { redirect_to @cash_flow, notice: 'Cash flow was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @cash_flow.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cash_flows/1
  # DELETE /cash_flows/1.json
  def destroy
    @cash_flow = CashFlow.find(params[:id])
    @cash_flow.destroy

    respond_to do |format|
      format.html { redirect_to cash_flows_url }
      format.json { head :no_content }
    end
  end
end
