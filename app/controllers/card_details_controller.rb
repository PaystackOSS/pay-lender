# frozen_string_literal: true

class CardDetailsController < ApplicationController
  protect_from_forgery except: :create
  # before_action :set_root_url, only: new

  # GET /card_details
  # GET /card_details.json
  def index
    @card_details = CardDetail.where(user_id: params[:user_id])
  end

  # GET /card_details/1
  # GET /card_details/1.json
  def show; end

  # GET /card_details/new
  def new
    @card_detail = CardDetail.new
    @user = User.find(session[:current_user])
    @session = session[:current_user]
    @card = @card_detail.initialize_transaction(@user.email, root_url).parsed_response
    redirect_to @card['data']['authorization_url']
  end

  # GET /card_details/1/edit
  def edit; end

  # POST /card_details
  # POST /card_details.json
  def create
    @request = CardDetail.new.verify_transaction(params[:trxref]).parsed_response

    @user = User.find_by_email(@request['data']['customer']['email'])

    @card_detail = CardDetail.new(auth_code: @request['data']['authorization']['authorization_code'],
                                  bin: @request['data']['authorization']['bin'],
                                  last_four: @request['data']['authorization']['last4'],
                                  bank: @request['data']['authorization']['bank'],
                                  brand: @request['data']['authorization']['brand'],
                                  country_code: @request['data']['authorization']['country_code'],
                                  user: @user)
    respond_to do |format|
      if @card_detail.save
        format.html { redirect_to user_card_details_path(@user.id), notice: 'Card detail was successfully created.' }
        format.json { render json: request.headers['Content-Type'], head: :ok }
      else
        format.html { render :new }
        format.json { render json: @card_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /card_details/1
  # PATCH/PUT /card_details/1.json
  def update
    respond_to do |format|
      if @card_detail.update(card_detail_params)
        format.html { redirect_to @card_detail, notice: 'Card detail was successfully updated.' }
        format.json { render :show, status: :ok, location: @card_detail }
      else
        format.html { render :edit }
        format.json { render json: @card_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /card_details/1
  # DELETE /card_details/1.json
  def destroy
    @card_detail.destroy
    respond_to do |format|
      format.html { redirect_to card_details_url, notice: 'Card detail was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  # def set_set_url
  #   Rails.application.config.root = root_url
  # end

  # Only allow a list of trusted parameters through.
  def card_detail_params
    params.permit(:trxref)
  end
end
