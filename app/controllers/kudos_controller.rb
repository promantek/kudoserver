class KudosController < APIController
  # GET /kudos
  def index
    @kudos = User.first.kudos_received
    render json: @kudos, status: :ok
  end

  # GET /users/:user_id/kudos
  def show
    @user = User.find(params[:id])
    @kudos = @user.kudos_received
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
    params.permit(:text, :receiver_id).merge(giver_id: current_user.id)
  end
end
