class Admin::UmrahPackagesController < ApplicationController
  before_action :get_umrah_package_detail, only: %i[ show edit update destroy]

  include UmrahPackageConcern

  def index
    @umrah_packages = Admin::UmrahPackage.all
  end

  def new
    @umrah_package = Admin::UmrahPackage.new
    @image_new = Image.new
  end

  def create
    @umrah_package = Admin::UmrahPackage.create(umrah_package_params)
    package_full_name = get_full_package_name(@umrah_package)
    @umrah_package.update(package_full_name: package_full_name)

    respond_to do |format|
      if @umrah_package.save
        format.html { redirect_to admin_umrah_packages_path, notice: "Umrah customer was successfully created." }
        format.json { render :show, status: :created, location: @umrah_package }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @umrah_package.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    @image =  @umrah_package.is_poster_available
  end


  def edit
    @image =  @umrah_package.is_poster_available
  end

  def update
    @umrah_package.update(umrah_package_params)
    redirect_to admin_umrah_packages_path
  end

  def destroy
    @umrah_package.destroy
    redirect_to admin_umrah_packages_path
  end

  private

  def get_umrah_package_detail
    @umrah_package = Admin::UmrahPackage.find(params[:id])
  end

  def umrah_package_params
    params.require(:admin_umrah_package).permit(:title, :package_type, :price, :hotel , :image_id, :rooms_per_pax, :package_full_name, image_attributes:[:name,:picture] )
  end

  def get_package_images
    @image = Image.all
  end

end
