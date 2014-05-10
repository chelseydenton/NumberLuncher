require 'sessions_helper'

class RelationshipsController < ApplicationController
  include SessionsHelper
  # before_action :signed_in_user

  respond_to :html, :js

  ###TODO following doesn't work
  ###THEN WORK ON UNFOLLOWING AND SEARCH

  def create
    #debugger
    @resto = Restaurant.find(params[:relationship][:restaurant_id])
    current_user.follow!(@resto)
    #debugger
    #respond_with @resto
    redirect_to @resto
  end

  def destroy
    @resto = Relationship.find(params[:id]).followed
    current_user.unfollow!(@resto)
    redirect_to restaurants_path
  end
end