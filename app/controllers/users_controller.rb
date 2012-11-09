class UsersController < ApplicationController
before_filter :logged_in_user
before_filter :tcc,             only: [:new, :create, :edit]

  def show
    @user = User.find(params[:id])
  end
	
  def new
  	@user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      flash.now[:success] = "Profile updated"
      render 'edit'
    else
      flash.now[:failure] = "Profile not updated"
      render 'edit'
    end
  end


  private
  def logged_in_user
    if(!logged_in?)
      redirect_to login_url
  end

  def tcc
    redirect_to root_url unless tcc?
  end
end
end