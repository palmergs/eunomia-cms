class Api::V1::ContentItemsController < Api::ApiController

  def index
    @content_items = ContentItem.page(params[:p])
    render json: @content_items, meta: {
      pagination: {
        total_pages: @content_items.total_pages,
        current_page: @content_items.current_page
      }
    }
  end

  def show
    @content_item = ContentItem.find(params[:id])
    render json: @content_item
  end

  def create
    @content_item = ContentItem.new(create_content_item_params)
    if @content_item.save
      render json: @content_item
    else
      render json: { errors: @content_item.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    @content_item = ContentItem.find(params[:id])
    if @content_item.update_attributes(update_content_item_params)
      render json: @content_item
    else
      render json: { errors: @content_item.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @content_item = ContentItem.find(params[:id])
    if @content_item.destroy
      render head: :ok
    else
      render json: {}, status: :unprocessable_entity
    end
  end

  private

    def create_content_item_params
      params.require(:content_item).permit(:parent_id, :content, :structure_item_id)
    end

    def update_content_item_params
      params.require(:content_item).permit(:parent_id, :content, :structure_item_id)
    end
end
