require 'scrape'

class UsersController < ApplicationController
  before_filter :logged_in_user

  before_filter :tcc,             only: [:new, :create ]
  before_filter :correct_user,    only: [:edit, :update]

  def home
    @time_worked = TimeWorked.new(:userid => current_user.id)
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
    username = params[:username]
    # check to see if username is already assigned (e.g. from /makeuser)
    if username
      info = UserInfo::get_user_info(username)
      if info  # if scrape didn't fail
        @user.username = username
        @user.name = info[:name]
        @user.boxNum = info[:box]
      end
    end
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

    if params[:user].include?(:password)
      @user.updating_password = true
    else
      @user.updating_password = false
    end

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

  def gen_info
  end

  private
  def logged_in_user
    if(!logged_in?)
      redirect_to login_url
    end

    def tcc
      redirect_to root_url unless tcc?
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user) || tcc?
    end
  end
end
