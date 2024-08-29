class Api::V1::TagsController < ApiController
  before_action :set_tag, only: %i[show]

  # GET /tags
  def index
    @tags = Tag.all

    paginate @tags, per_page: 15
  end

  # GET /tags/1
  def show
    render json: @tag
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_tag
    @tag = Tag.find(params[:id])
  end
end
