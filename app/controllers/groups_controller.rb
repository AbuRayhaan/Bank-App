class GroupsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_group, only: %i[show edit update destroy]

  def index
    @groups = current_user.groups
  end

  def show
    @group = Group.find(params[:id])
    @entities = @group.entities
  end

  def new
    @group = Group.new
  end

  def create
    @user = current_user
    @group = Group.new(group_params)
    @group.user_id = @user.id
    respond_to do |format|
      format.html do
        if @group.save
          flash[:success] = 'Group saved successfully'
          redirect_to groups_path
        else
          flash[:error] = 'Error: Group could not be saved'
          redirect_to new_group_path(@user)
        end
      end
    end
  end

  def edit
    @group = Group.find(params[:id])
  end

  def update
    @group = Group.find(params[:id])
    if @group.update(group_params)
      flash[:notice] = 'Group updated successfully'
      redirect_to groups_path(current_user.id)
    else
      render :edit
    end
  end

  def destroy
    @group = Group.find(params[:id])
    @group.destroy
    redirect_to groups_path(current_user.id)
  end

  private

  def set_group
    @group = Group.find(params[:id])
  end

  def group_params
    params.require(:group).permit(:name, :icon, :user_id)
  end
end
