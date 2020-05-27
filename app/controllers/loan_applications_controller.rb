# frozen_string_literal: true

class LoanApplicationsController < ApplicationController
  before_action :set_loan_application, only: %i[show edit update destroy]

  # GET /loan_applications
  # GET /loan_applications.json
  def index
    @loan_applications = LoanApplication.where(user_id: params[:user_id])
  end

  # GET /loan_applications/1
  # GET /loan_applications/1.json
  def show; end

  # GET /loan_applications/new
  def new
    @loan_application = LoanApplication.new
    @banks = @loan_application.get_banks['data']
  end

  # GET /loan_applications/1/edit
  def edit; end

  # POST /loan_applications
  # POST /loan_applications.json
  def create
    @loan_application = LoanApplication.new(loan_application_params)
    @user_email = User.find(params[:user_id]).email
    @loan_application.create_recipient(params[:account_name], params[:account_number],
                                       params[:banks], @user_email, params[:loan_type_id])
    respond_to do |format|
      if @loan_application.save
        format.html { redirect_to :user_loan_applications, notice: 'Loan application was successfully created.' }
        format.json { render :show, status: :created, location: @loan_application }
      else
        format.html { render :new }
        format.json { render json: @loan_application.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /loan_applications/1
  # PATCH/PUT /loan_applications/1.json
  def update
    respond_to do |format|
      if @loan_application.update(loan_application_params)
        format.html { redirect_to @loan_application, notice: 'Loan application was successfully updated.' }
        format.json { render :show, status: :ok, location: @loan_application }
      else
        format.html { render :edit }
        format.json { render json: @loan_application.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /loan_applications/1
  # DELETE /loan_applications/1.json
  def destroy
    @loan_application.destroy
    respond_to do |format|
      format.html { redirect_to loan_applications_url, notice: 'Loan application was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_loan_application
    @loan_application = LoanApplication.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def loan_application_params
    params.permit(:account_name, :account_number, :user_id, :banks, :loan_type_id)
  end
end
