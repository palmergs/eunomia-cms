class Api::V1::StructureItemsController < ApplicationController

  def index
    @structure_items = StructureItem.page(params[:p])
    render json: @structure_items, meta: {
      pagination: {
        total_pages: @structure_items.total_pages,
        current_page: @structure_items.current_page
      }
    }
  end

  def show
    @structure_item = StructureItem.find(params[:id])
    render json: @structure_item
  rescue Exception => e
    render json: {}, status: :not_found
  end

  def create
    @structure_item = StructureItem.new(create_structure_item_params)
    if @structure_item.save
      render json: @structure_item
    else
      render json: { errors: @structure_item.errors.full_messages }, status: :unprocessable_entity
    end
  rescue Exception => e
    render json: {}, status: :not_found
  end

  def update
    @structure_item = StructureItem.find(params[:id])
    if @structure_item.update_attributes(update_structure_item_params)
      render json: @structure_item
    else
      render json: { errors: @structure_item.errors.full_messages }, status: :unprocessable_entity
    end
  rescue Exception => e
    render json: {}, status: :not_found
  end

  def destroy
    @structure_item = StructureItem.find(params[:id])
    if @structure_item.destroy
      render json: {}
    else
      render json: {}, status: :unprocessable_entity
    end
  rescue Exception => e
    render json: {}, status: :not_found
  end

  private

    def create_structure_item_params
      params.require(:structure_item).permit(:type, 
          :ident, 
          :name, 
          :description, 
          params: [ :class ])
    end

    def update_structure_item_params
      params.require(:structure_item).permit(:type,
          :ident,
          :name,
          :description,
          params: [ :class ])
    end

end
