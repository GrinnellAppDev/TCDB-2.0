class LabsController < ApplicationController

  def index
    @labs = Lab.all
  end
  

  def edit
   @lab = Lab.find(params[:id])
  end

 def show
   @lab = Lab.find(params[:id])
   render 'edit'
 end



 def update
  @lab = Lab.find(params[:id])
  @lab.attributes = params[:lab]
  @lab.shift_times.each { |st| st.attributes = params[:shift_time][st.id.to_s] }
  # if @lab.valid? && @lab.shift_times.all?(&:valid?)
  @lab.lab_times.each { |lt| lt.attributes = params[:lab_time][lt.id.to_s] }

  @lab.save!
  @lab.shift_times.each(&:save!)  
  @lab.lab_times.each(&:save!)    
  
  # end.
  redirect_to :action => 'edit', :id => @lab
end

def schedule
  #  lab = Lab.find(params[:id])
  # @shifts = Shift.find(:all, :conditions => {:lab_id => lab.id})
end


end
