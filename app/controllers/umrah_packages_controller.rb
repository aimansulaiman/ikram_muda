class UmrahPackagesController < ApplicationController
  before_action :get_umrah_package_detail, only: %i[ show edit update destroy]

  def index
    @umrah_packages = UmrahPackage.all
  end

  def new
    @umrah_package = UmrahPackage.new
    # @is_new_package = @umrah_package
    @is_new_package = params[:action] == "new"
    @enable_poster_upload=true
    @image_new = Image.new
  end

  def create
    @umrah_package = UmrahPackage.create(umrah_package_params)

    respond_to do |format|
      if @umrah_package.save
        format.html { redirect_to umrah_packages_path, notice: "Umrah customer was successfully created." }
        format.json { render :show, status: :created, location: @umrah_package }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @umrah_package.errors, status: :unprocessable_entity }
      end
    end


    # image_title = params[:umrah_package][:title]
    # image_picture = params[:umrah_package][:picture]
    # # umrah_package_id = @umrah_package.id
    # # Image.create(name:image_title,picture:image_picture,umrah_package_id: umrah_package_id)
    # redirect_to umrah_packages_path
  end

  def show
    if params[:is_poster_for_package]
      @umrah_package = UmrahPackage.find(params[:id].to_i)
      @umrah_package.image_id = params[:image_id].to_i
      @umrah_package.save
      @image = @umrah_package.image
    else
      @umrah_package = UmrahPackage.find(params[:id])
      @image = @umrah_package.image
    end

  end

  def edit
    @enable_poster_upload = true
    umrah_package = UmrahPackage.find(params[:id])
    package_image = umrah_package.image_id

    if package_image.blank?
      @image = false
    else
      @image = Image.find(package_image)
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
    params.require(:umrah_package).permit(:title, :package_type, :price, :hotel, :image_id)
  end

  def get_package_images
    @image = Image.all
  end

end
