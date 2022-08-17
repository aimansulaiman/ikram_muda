class Admin::UmrahPackagesController < ApplicationController
  before_action :get_umrah_package_detail, only: %i[ show edit update destroy]
  layout 'admin'

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
    @image = @umrah_package.is_poster_available
  end

  def edit
    @image = @umrah_package.is_poster_available
  end

  def update
    respond_to do |format|
      if @umrah_package.update(umrah_package_params)
        format.html { redirect_to admin_umrah_packages_path, notice: "Umrah customer was successfully updated." }
        format.json { render :show, status: :ok, location: @umrah_customer }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @umrah_package.errors, status: :unprocessable_entity }
      end
    end
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
    params
      .require(:admin_umrah_package).
      permit(
        :title,
              :package_type,
              :price,
              :hotel_mekah,
              :hotel_madinah,
              :image_id,
              :rooms_per_pax,
              image_attributes: [:name, :picture]
            )
  end

  def get_package_images
    @image = Image.all
  end

end
