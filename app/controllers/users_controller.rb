class UsersController < ApplicationController
  def index
    if current_user.profile_edited?
      @projects = Project.all
      @user_search = User.search(params[:query], current_user)
    else
      redirect_to edit_user_path(current_user)
    end

      respond_to do |format|
        format.html
        format.js
      end
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    @user.update(user_params)
    @user.skill = Skill.find(params["user"]["skill"])
    @user.preference = Preference.find(params["user"]["preference"])
    if @user.save
      redirect_to user_path(current_user)
    else
      flash[:notice] = @user.errors
      render :edit
    end
  end

  def show
    @users = User.all
    @user = User.find(params[:id])
  end

  def destroy
    @workspace = Workspace.find(params[:id])
    if @workspace.destroy
      flash[:notice] = "Who wants to do work, anyway? Workspace deleted."
    else
      flash[:notice] = "I'm sorry Dave, I can't do that."
    end
    redirect_to workspaces_path
  end

  private

  def user_params
    params.require(:user).permit(:example_url1,
      :example_url1_img,
      :example_url2,
      :example_url2_img,
      :techinterests,
      :location,
      :email,
      :website,
      :job,
      :about)
  end
end

