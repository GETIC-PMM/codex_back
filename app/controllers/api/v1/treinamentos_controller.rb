class Api::V1::TreinamentosController < ApiController
  include Orderable

  before_action :set_treinamento, only: %i[show]

  has_scope :categoria_id, only: :index
  has_scope :tag_id, only: :index
  has_scope :search, only: :index

  # GET /treinamentos
  def index
    @treinamentos = apply_scopes(Treinamento).order(ordering_params(params)).all

    paginate @treinamentos, per_page: params[:per_page] || 10
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
