class UsersController < ApplicationController
  skip_before_filter :require_login, :only => [:new, :create]
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      redirect_to root_url, :notice => "Welcome!"
    else
      render :new
    end
  end
  
  def show
    @user = User.find(params[:id])
  end
end
