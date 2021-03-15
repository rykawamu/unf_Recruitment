class PhotosController < ApplicationController
  before_action :move_to_signed_in

  def show
    @user = current_user
    @photos = @user.photos
  end

  def create
    @photos = current_user.photos.build(micropost_params)
    if @photos.save
      flash[:success] = "Photo created!"
      redirect_to phptolist_url
    else
      render root_path
    end
  end

  def destroy
  end

  private

    def micropost_params
      params.require(:photos).permit(:title,:picture)
    end
end
