class StaticPagesController < ApplicationController
  before_action :move_to_signed_in

  def about
  end
end
