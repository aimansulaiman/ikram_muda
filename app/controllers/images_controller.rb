class ImagesController < ApplicationController
  before_action :set_image, only: %i[ show edit update destroy ]
  before_action :umrah_package

  # GET /images or /images.json
  def index
    @images = Image.all
  end

  # GET /images/1 or /images/1.json
  def show

  end

  # GET /images/new
  def new
    @image = Image.new

    if params[:is_update_poster_from_package]
      @is_update_poster_from_package = params[:is_update_poster_from_package]
      @umrah_package_id = params[:package_id]
    end

  end

  # GET /images/1/edit
  def edit
    @is_from_package = params[:is_from_package]
    @package_id = params[:package_id]
  end

  def new_wp
    @image = Image.new
    @is_update_poster_from_package = params[:format]
    render new_image_path
  end

  # POST /images or /images.json
  def create
    @image = Image.new(image_params)

    if params[:is_update_poster_from_package]
      umrah_package_id = params[:is_update_poster_from_package].to_i
      respond_to do |format|
        if @image.save
          format.html { redirect_to umrah_package_path(umrah_package_id,package_id: umrah_package_id,image_id: @image.id,is_poster_for_package: !!params[:is_update_poster_from_package]), method: :get ,notice: "Image was successfully created." }
          format.json { render :show, status: :created, location: @image }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @image.errors, status: :unprocessable_entity }
        end
      end

    else
      respond_to do |format|
        if @image.save
          format.html { redirect_to image_url(@image), notice: "Image was successfully created." }
          format.json { render :show, status: :created, location: @image }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @image.errors, status: :unprocessable_entity }
        end
      end

    end

  end

  # PATCH/PUT /images/1 or /images/1.json
  def update
    respond_to do |format|
      if @image.update(image_params)
        format.html {
          is_update_package_poster = params[:commit] == "Update Package Poster"
          if is_update_package_poster
            image = Image.find(params[:id])
            umrah_package_id = image.umrah_package.id
            redirect_to edit_umrah_package_path(umrah_package_id), notice: "Image was successfully updated."
          else
            redirect_to image_url(@image), notice: "Yes berjaya"
          end

        }
        format.json { render :show, status: :ok, location: @image }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @image.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /images/1 or /images/1.json
  def destroy
    @image.destroy

    respond_to do |format|
      format.html { redirect_to images_url, notice: "Image was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_image
      @image = Image.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def image_params
      params.require(:image).permit(:name, :picture, :umrah_package_id)
    end

  def umrah_package
    @umrah_package = UmrahPackage.all
  end
end
