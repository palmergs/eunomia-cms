class Api::V1::StructureRelationsController < ApplicationController

  def index
  end

  def show
  end

  def create
  end

  def destroy
  end

  private

    def create_structure_relation_params
      params.require(:structure_relation).permit(:parent_id,
          :child_id,
          :optional,
          :rel_order)
    end
end
