include ApplicationHelper

def log_in(user) 
	visit login_path
	fill_in "Username", with: user.username
	fill_in "Password", with: user.password
	click_button "Log in"
	cookies[:remember_token] = user.remember_token
end

def log_out 
	current_user = nil 
    cookies.delete(:remember_token)
end

  #Helps us in sorting the table
  def sortable(column, title = nil)
  	title ||= column.titleize
  	css_class = column == sort_column ? "current #{sort_direction}" : nil
  	# direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
  	direction = column == params[:sort] && params[:direction] == "asc" ? "desc" : "asc"
  	link_to title, {:sort => column, :direction => direction}, {:class => css_class}
  end