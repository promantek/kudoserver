class KudosController < ApplicationController
  # GET /kudos
  def index
    @kudos = Kudo.all

    render json: @kudos, status: :ok
  end

  # POST /kudos
  def create
    @kudo = Kudo.create!(kudo_params)
    render json: @kudo, status: :created
  end

  # DELETE /kudos/:id
  def destroy
    Kudo.find(params[:id]).destroy
    head :no_content
  end

  private

  def kudo_params
    params.require(:kudo).permit(:text, :giver_id, :receiver_id)
  end
end
