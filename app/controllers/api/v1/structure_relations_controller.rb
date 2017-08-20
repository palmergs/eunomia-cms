class Api::V1::StructureRelationsController < Api::ApiController

  def index
    @structure_relations = StructureRelation.page(params[:p])
    render json: @structure_relations, meta: {
      pagination: {
        total_pages: @structure_relations.total_pages,
        current_page: @structure_relations.current_page
      }
    }
  end

  def show
    @structure_relation = StructureRelation.find(params[:id])
    render json: @structure_relation
  end

  def create
    @structure_relation = StructureRelation.new(create_structure_relation_params)
    if @structure_relation.save
      render json: @structure_relation
    else
      render json: { errors: @structure_relation.errors.full_messages },
          status: :unprocessable_entity
    end
  end

  def update
    @structure_relation = StructureRelation.find(params[:id])
    if @structure_relation.update_attributes(update_structure_relation_params)
      render json: @structure_relation
    else
      render json: { errors: @structure_relation.errors.full_messages },
          status: :unprocessable_entity
    end
  end


  def destroy
    @structure_relation = StructureRelation.find(params[:id])
    if @structure_relation.destroy
      render head: :ok
    else
      render json: {}, status: :unprocessable_entity
    end
  end

  private

    def create_structure_relation_params
      params.require(:structure_relation).permit(:parent_id,
          :child_id,
          :optional,
          :rel_order)
    end

    def update_structure_relation_params
      params.require(:structure_relation).permit(:optional, :rel_order)
    end
end
