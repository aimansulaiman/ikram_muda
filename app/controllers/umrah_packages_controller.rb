class UmrahPackagesController < ApplicationController
  before_action :get_umrah_package_detail, only: %i[ show edit update destroy]

  def index
    @umrah_packages = UmrahPackage.all
  end

  def new
    @umrah_package = UmrahPackage.new
    @is_new_package = @umrah_package
  end

  def create
    @umrah_package = UmrahPackage.create(umrah_package_params)
    redirect_to umrah_packages_path
  end

  def show
    @umrah_package = UmrahPackage.find(params[:id])
  end

  def edit

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

end
