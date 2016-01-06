class Api::V1::InlineRefsController < ApplicationController

  def index
    @inline_refs = InlineRef.page(params[:p])
    render json: @inline_refs, meta: {
      pagination: {
        total_pages: @inline_refs.total_pages,
        current_page: @inline_refs.current_page
      }
    }
  end

  def show
    @inline_ref = InlineRef.find(params[:id])
    render json: @inline_ref
  rescue ActiveRecord::RecordNotFound => e
    render json: {}, status: :not_found
  end

  def create
    @inline_ref = InlineRef.new(create_inline_ref_params)
    if @inline_ref.save
      render json: @inline_ref
    else
      render json: { errors: { @inline_ref.errors.full_messages } },
          status: :unprocessable_entity
    end
  end

  def update
    @inline_ref = InlineRef.find(params[:id])
    if @inline_ref.update_attributes(update_inline_ref_params)
      render json: @inline_ref
    else
      render json: { errors: { @inline_ref.errors.full_messages } },
          status: :unprocessable_entity
    end
  rescue ActiveRecord::RecordNotFound => e
    render json: {}, status: :not_found
  end

  def destroy
    @inline_ref = InlineRef.find(params[:id])
    if @inline_ref.destroy
      render head: :ok
    else
      render json: {}, status: :unprocessable_entity
    end
  rescue ActiveRecord::RecordNotFound => e
    render json: {}, status: :not_found
  end

  private

    def create_inline_ref_params
      params.require(:inline_ref).permit(:content_item_id,
          :reference_item_id,
          :inline_item_id,
          :start_pos,
          :end_pos,
          :display)
    end

    def update_inline_ref_params
      params.require(:inline_ref).permit(:start_pos,
          :end_pos,
          :display)
    end

end
