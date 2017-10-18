class KudosController < APIController
  def index
    @kudos = Kudo.all.eager_load(:giver, :receiver)
    render json: @kudos.map(&:with_giver_and_receiver), status: :ok
  end

  def show
    @kudos = User.find(params[:id])
                 .kudos_received
                 .eager_load(:giver)
                 .order(created_at: :desc)
    render json: @kudos.map(&:with_giver), status: :ok
  end

  def create
    @kudo = Kudo.create!(kudo_params).as_json
    @kudo[:over_limit] = true if current_user.over_limit?
    render json: @kudo, status: :created
  end

  def destroy
    Kudo.find(params[:id]).destroy
    head :no_content
  end

  private

  def kudo_params
    params.permit(:text, :receiver_id).merge(giver_id: current_user.id)
  end
end
