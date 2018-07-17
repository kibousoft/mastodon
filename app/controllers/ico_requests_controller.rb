class IcoRequestsController < ApplicationController
  before_action :set_ico_request, only: [:show, :edit, :update, :destroy]

  # GET /ico_requests
  def index
    @ico_requests = IcoRequest.all
  end

  # GET /ico_requests/1
  def show
  end

  # GET /ico_requests/new
  def new
    @ico_request = IcoRequest.new
    @ico_request.campaign_name = params[:campaign]
  end

  # GET /ico_requests/1/edit
  def edit
  end

  # POST /ico_requests
  def create
    unless ico_request_check_params[:check_1] && ico_request_check_params[:check_3] && ico_request_check_params[:check_4]
      redirect_to new_ico_requests_path(campaign: ico_request_params[:campaign_name]), notice: 'Please check confirm items'
      return
    end
    @ico_request = IcoRequest.new(ico_request_params)
    @ico_request.user = current_user if current_user.present?
    @ico_request.ico_event_id = 1

    if @ico_request.save
      if current_user.present?
        redirect_to '/share?text=I%20participated%20in%20the%20pre-ICO%20of%20PHOTON%20GOLD.%0Ahttps%3A%2F%2Fphoton.gold%2F'
      else
        redirect_to 'https://photon.gold/'
      end
    else
      render :new, notice: 'Validation failed'
    end
  end

  # PATCH/PUT /ico_requests/1
  def update
    if @ico_request.update(ico_request_params)
      redirect_to @ico_request, notice: 'Ico request was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /ico_requests/1
  def destroy
    @ico_request.destroy
    redirect_to ico_requests_url, notice: 'Ico request was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ico_request
      @ico_request = IcoRequest.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def ico_request_params
      params.require(:ico_request).permit(:amount, :email, :eth_wallet_address, :token_wallet_address, :campaign_name)
    end

    def ico_request_check_params
      params.permit(:check_1, :check_2, :check_3, :check_4)
    end
end
