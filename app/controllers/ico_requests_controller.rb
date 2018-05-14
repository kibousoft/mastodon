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
  end

  # GET /ico_requests/1/edit
  def edit
  end

  # POST /ico_requests
  def create
    @ico_request = IcoRequest.new(ico_request_params)

    if @ico_request.save
      redirect_to @ico_request, notice: 'Ico request was successfully created.'
    else
      render :new
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
      params.require(:ico_request).permit(:amount, :email, :eth_wallet_address, :token_wallet_address)
    end
end