class Api::MicropostsController < ApplicationController
  def index
    microposts = Micropost.includes(:user).order(created_at: :desc)
    render json: microposts, each_serializer: MicropostSerializer
  end
end
