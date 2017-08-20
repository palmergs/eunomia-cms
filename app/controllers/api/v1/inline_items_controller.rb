class Api::V1::InlineItemsController < Api::ApiController
  def index
    @inline_items = InlineItem.page(params[:p])
    render json: @inline_items, meta: {
      pagination: {
        total_pages: @inline_items.total_pages,
        current_page: @inline_items.current_page
      }
    }
  end

  def show
    @inline_item = InlineItem.find(params[:id])
    render json: @inline_item
  end

  def create
    @inline_item = InlineItem.new(create_inline_item_params)
    if @inline_item.save
      render json: @inline_item
    else
      render json: { errors: @inline_item.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    @inline_item = InlineItem.find(params[:id])
    if @inline_item.update_attributes(update_inline_item_params)
      render json: @inline_item
    else
      render json: { errors: @inline_item.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @inline_item = InlineItem.find(params[:id])
    if @inline_item.delete
      render head: :ok
    else
      render json: {}, status: :unprocessable_entity
    end
  end

  private

    def create_inline_item_params
      params.require(:inline_item)
    end

    def update_inline_item_params
      params.require(:inline_item)
    end

end
