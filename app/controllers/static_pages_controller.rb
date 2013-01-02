class StaticPagesController < ApplicationController

  def subrequest
  end

  def schedule
  end
   
  def combo
  end

  def directory
    @users = User.all
  end

  def totalhrs
  end

  def timesheet
  end

end
