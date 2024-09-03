class Api::V1::CategoriasController < ApiController
  before_action :set_categoria, only: %i[show]

  # GET /categorias
  def index
    @categorias = Categoria.all

    if [params[:search]].present? && params[:searchBy].present?
      @categorias = @categorias.where("#{params[:searchBy]} ILIKE ?", "%#{params[:search]}%")
    end

    paginate @categorias, per_page: params[:per_page] || 10
  end

  # GET /categorias/1
  def show
    render json: @categoria
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_categoria
    @categoria = Categoria.find(params[:id])
  end
end
