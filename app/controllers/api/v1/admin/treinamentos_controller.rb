class Api::V1::Admin::TreinamentosController < AdminController
  before_action :set_treinamento, only: %i[show update destroy]

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

  # POST /treinamentos
  def create
    @treinamento = Treinamento.new(treinamento_params)

    if @treinamento.save
      render json: @treinamento, status: :created
    else
      render json: @treinamento.errors.full_messages, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /treinamentos/1
  def update
    if @treinamento.update(treinamento_params)
      render json: @treinamento
    else
      render json: @treinamento.errors, status: :unprocessable_entity
    end
  end

  # DELETE /treinamentos/1
  def destroy
    @treinamento.destroy!
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_treinamento
    @treinamento = Treinamento.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def treinamento_params
    params.permit(
      :titulo,
      :resumo,
      :categoria_id,
      :destaque_home,
      :autor_id,
      :data_publicacao,
      :capa,
      :corpo,
      tag_ids: []
    )
  end
end
