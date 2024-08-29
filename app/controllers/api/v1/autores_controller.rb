class Api::V1::AutoresController < ApiController
  before_action :set_autor, only: %i[show]

  # GET /autores
  def index
    @autores = Autor.all

    paginate @autores, per_page: 15
  end

  # GET /autores/1
  def show
    render json: @autor
  end
  private

  # Use callbacks to share common setup or constraints between actions.
  def set_autor
    @autor = Autor.find(params[:id])
  end

end
