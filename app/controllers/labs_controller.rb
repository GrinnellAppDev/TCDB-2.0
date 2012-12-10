class LabsController < ApplicationController


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
  #They aren't using this.. but they should be.. instead of allowing the view to reach the model. 
   @lab = Lab.find(2)
   @shifts = Shift.find(:all, :conditions => {:lab_id => 2})
end


end
