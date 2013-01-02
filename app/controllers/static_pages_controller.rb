class StaticPagesController < ApplicationController

  helper_method :sort_column, :sort_direction


  def subrequest
  end

  def schedule
  end
   
  def combo
  end

  def directory
    @users = User.order(sort_column + " " + sort_direction)
  end

  def totalhrs
  end

  def timesheet
  end

  private

  def sort_column
    User.column_names.include?(params[:sort]) ? params[:sort] : "name"
  end


  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end

end
