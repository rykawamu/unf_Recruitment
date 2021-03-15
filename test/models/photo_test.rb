require 'test_helper'

class PhotoTest < ActiveSupport::TestCase
  def setup
    @user = users(:one)
    #Userモデル経由でPhotoモデルを作成
    @photo = @user.photos.build(title: "Sample1", picture: "sample1.png")
  end

  test "should be valid" do
    assert @photo.valid?
  end

  test "user id should be present" do
    @photo.user_id = nil
    assert_not @photo.valid?
  end

  test "title should be present(nonblank)" do
    @photo.title = " " * 6
    assert_not @photo.valid?
  end

  test "name should not be too long(maximum: 30)" do
    @photo.title = "a" * 31
    assert_not @photo.valid?
  end

  test "picture should be present(nonblank)" do
    @photo.picture = " " * 9
    assert_not @photo.valid?
  end

end
