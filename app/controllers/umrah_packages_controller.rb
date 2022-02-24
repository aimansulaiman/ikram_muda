class UmrahPackagesController < ApplicationController
  before_action :get_umrah_package_detail, only: %i[ show edit update destroy]

  def index
    @umrah_packages = UmrahPackage.all
  end

  def new
    @umrah_package = UmrahPackage.new
    @is_new_package = @umrah_package
    @is_new_package = params[:action] == "new"
    @image_new = Image.new
  end

  def create
    @umrah_package = UmrahPackage.create(umrah_package_params)
    image_title = params[:umrah_package][:title]
    image_picture = params[:umrah_package][:picture]
    umrah_package_id = @umrah_package.id
    Image.create(name:image_title,picture:image_picture,umrah_package_id: umrah_package_id)
    redirect_to umrah_packages_path
  end

  def show
    @umrah_package = UmrahPackage.find(params[:id])
    @image = @umrah_package.image
  end

  def edit
    if Image.where(id:params[:id]).blank?
      @image = false
    else
      @image = Image.find(params[:id])
    end
  end

  def update
    @umrah_package.update(umrah_package_params)
    redirect_to umrah_packages_path
  end

  def destroy
    @umrah_package.destroy
    redirect_to umrah_packages_path
  end

  private

  def get_umrah_package_detail
    @umrah_package = UmrahPackage.find(params[:id])
  end

  def umrah_package_params
    params.require(:umrah_package).permit(:title, :package_type, :price, :hotel)
  end

  def get_package_images
    @image = Image.all
  end

end
