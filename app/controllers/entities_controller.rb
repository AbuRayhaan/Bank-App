# frozen_string_literal: true

class EntitiesController < ApplicationController
  before_action :authenticate_user!

  def index
    @group = Group.find(params[:group_id])
    @entities = current_user.entities
  end

  def new
    @group = Group.find(params[:group_id])
    @entities = @group.entities
  end

  def create
    @group = Group.find(params[:group_id])
    @entity = @group.entities.build(entity_params)
    @entity.user = current_user
    if @entity.save
      flash[:notice] = 'Entity created successfully'
      redirect_to group_entities_path(current_user, @group)
    else
      flash[:alert] = 'Entity not created'
      render :new
    end
  end

  def destroy
    @entity = Entity.find(params[:id])
    @entity.destroy
    flash[:notice] = 'Entity was deleted successfully.'
    redirect_to group_entity_path
  end

  private

  def entity_params
    params.require(:entity).permit(:name, :amount)
  end
end
