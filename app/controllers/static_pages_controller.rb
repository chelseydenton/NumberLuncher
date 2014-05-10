class StaticPagesController < ApplicationController
	include SessionsHelper
  def home
  	if signed_in?
      #@restaurants = Restaurant.paginate(page: params[:page])
      @restaurants = current_user.followed_restaurants.paginate(page: params[:page])
    end
  end

  def help
  end

  def about
  end

  def contact
  end

end
