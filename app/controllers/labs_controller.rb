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
    @lab.save!
    @lab.shift_times.each(&:save!)
    redirect_to :action => 'edit', :id => @lab
    #render :action => 'edit'
  # end
end

end
