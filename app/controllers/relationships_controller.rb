class RelationshipsController < ApplicationController
  before_action :signed_in_user

  respond_to :html, :js

  def create
    @resto = Restaurant.find(params[:relationship][:followed_id])
    current_user.follow!(@resto)
    respond_with @resto
  end

  def destroy
    @resto = Relationship.find(params[:id]).followed
    current_user.unfollow!(@resto)
    redirecto_to restaurants_path
  end
end