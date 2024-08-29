class Api::V1::TreinamentosController < ApiController
  before_action :set_treinamento, only: %i[show]

  # GET /treinamentos
  def index
    @treinamentos = Treinamento.all

    if params[:categoria_id].present?
      @treinamentos = @treinamentos.where(categoria_id: params[:categoria_id])
    elsif params[:tag_id].present?
      @treinamentos = @treinamentos.where(tag_id: params[:tag_id])
    elsif params[:autor_id].present?
      @treinamentos = @treinamentos.where(autor_id: params[:autor_id])
    end

    paginate @treinamentos, per_page: 15
  end

  # GET /treinamentos/1
  def show
    render json: @treinamento
  end

  # GET /treinamentos/destaque_home
  def destaque_home
    @treinamentos = Treinamento.where(destaque_home: true)

    render json: @treinamentos
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_treinamento
    @treinamento = Treinamento.find(params[:id])
  end
end
