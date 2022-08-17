class Admin::UserRolesController < ApplicationController
  layout 'admin'

  def index
    @user_roles =  Admin::UserRole.all
  end

  def new
    @user_role = Admin::UserRole.new
  end

  def create
    @user_role = Admin::UserRole.create(user_roles_params)
    respond_to do |format|
      if @user_role.save
        format.html { redirect_to admin_user_roles_path, notice: "User role was successfully created." }
        format.json { render :show, status: :created, location: @user_role }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user_role.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @user_role = Admin::UserRole.find(params[:id]).destroy
    byebug
    redirect_to admin_user_roles_path
    respond_to do |format|
      if @user_role.save
        byebug
        format.html { redirect_to admin_user_roles_path, notice: "User role was successfully destroyed." }
      else

        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user_role.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def user_roles_params
    params
      .require(:admin_user_role)
      .permit(
        :name,
        :email,
        :roles
      )
  end

end
