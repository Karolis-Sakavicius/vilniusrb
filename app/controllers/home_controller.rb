class HomeController < ApplicationController
  def index
    if @current_user
      redirect_to '/v1/posts'
    else
      redirect_to '/participants'
    end
  end
end
