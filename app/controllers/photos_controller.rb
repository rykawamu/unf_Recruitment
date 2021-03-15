class PhotosController < ApplicationController
  before_action :move_to_signed_in

  def show
    @user = current_user
    @photos = @user.photos
  end

  def new
    @photos = current_user.photos.new
  end

  def create
    @photos = current_user.photos.build(photo_params)

    uploaded_file = picture_params[:picture]
    if uploaded_file && uploaded_file.original_filename
      output_path = Rails.root.join('public/images', uploaded_file.original_filename)
      File.open(output_path, 'w+b') do |fp|
        fp.write  uploaded_file.read
      end
      @photos.picture = uploaded_file.original_filename
    end

    if @photos.save
      flash[:success] = "Photo created!"
      redirect_to photolist_path
    else
      respond_to do |format|
        format.html { render :new, status: :unprocessable_entity  }
        format.json { render json: @photos.errors, status: :unprocessable_entity }
        end
    end
  end

  def destroy
  end

  private

    def photo_params
      params.require(:photo).permit(:title,:picture)
    end

    def picture_params
      params.require(:photo).permit(:picture)
    end
end
