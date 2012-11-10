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
    current_user_test = current_user?(@user)

    if @user.update_attributes(params[:user])
        flash.now[:success] = "Profile updated"
        # Remember_token gets reset when the user is saved we have to relog
        # in the the user updates his/her own account details.
        # http://ruby.railstutorial.org/chapters/updating-showing-and-deleting-users#sec-updating_users
        if current_user_test
          log_in @user
        end
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