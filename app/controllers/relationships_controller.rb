class RelationshipsController < ApplicationController
  # before_action :signed_in_user

  respond_to :html, :js

  ###TODO following doesn't work
  ###THEN WORK ON UNFOLLOWING AND SEARCH

  def create
    @resto = Restaurant.find(params[:relationship][:restaurant_id])
    current_user.follow!(@resto)
    respond_with @resto
  end

  def destroy
    @resto = Relationship.find(params[:id]).followed
    current_user.unfollow!(@resto)
    redirecto_to restaurants_path
  end
end