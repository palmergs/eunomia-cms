class DataInstancesController < ApplicationController
  before_action :set_data_template

  def index
    @data_instances = @data_template.data_instances
  end

  def show
    @data_instance = @data_template.data_instances.find(params[:id])
  end

  def new
    @data_instance = @data_template.data_instances.build
  end

  def create
    @data_instance = @data_template.data_instances.build(create_data_instance_params)
    if @data_instance.save
      respond_to do |format|
        format.html { redirect_to(@data_instance) }
      end
    else
      render :new
    end
  end

  def edit
    @data_instance = @data_template.find(params[:id])
  end

  def update
    @data_instance = @data_template.find(params[:id])
    if @data_instance.update_attributes(update_data_instance_params)
      respond_to do |format|
        format.html { redirect_to(@data_instance) }
      end
    else
      render :edit
    end
  end

  def destroy
    @data_instance = @data_template.find(params[:id])
    if @data_instance.destroy
      respond_to do |format|
        format.html { redirect_to(data_instances_path) }
      end
    else
      respond_to do |format|
        format.html { redirect_to(@data_instance) }
      end
    end
  end

  private def create_data_instance_params
    params.require(:data_instance).permit(:values, :params)
  end

  private def update_data_instance_params
    params.require(:data_instance).permit(:values, :params)
  end

  private def set_data_template
    @data_template = DataTemplate.find(params[:data_template_id])
  end
end
