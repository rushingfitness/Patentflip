class SearchesController < ApplicationController

  def new
    @user = current_user
    @search = Search.new
  end

  def create
    @search = Search.create!(params[:search])
    redirect_to @search
  end

  def show
    @user = current_user
    @searches = Search.new
    @search = Search.find(params[:id])
  end

end