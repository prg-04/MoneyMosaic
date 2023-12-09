class MainController < ApplicationController
  before_action :verify_user

  def index; end

  private

  def verify_user
    return if user_signed_in?

    redirect_to splash_path
  end
end
