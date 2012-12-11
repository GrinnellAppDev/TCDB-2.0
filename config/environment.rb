# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application

Tcdb2::Application.initialize!


# Date format with slashes (12/27/2012)
Time::DATE_FORMATS[:slashes] = "%d/%m/%Y"


#Regular Time with (04:00AM CST)
Time::DATE_FORMATS[:shift_time] = "%I:%M%p"

#Regular Time with TimeZone (04:00AM CST)
Time::DATE_FORMATS[:shift_time_with_time_zone] = "%I:%M%p %Z"


