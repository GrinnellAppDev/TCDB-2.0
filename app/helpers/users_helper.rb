module UsersHelper
	 # Returns the image from the given user. Checks if there is uploaded image, else uses the image in db. 
  # def gravatar_for(user)
  #   gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
  #   gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
  #   image_tag(gravatar_url, alt: user.name, class: "gravatar")
  # end


	# We should probably just search for any file with @user.username instead of 
	# appending .jpg/.png to what we search for 
	def photo_for(user)
		if (Rails.application.assets.find_asset( "user_uploaded_photos/" + @user.username + ".jpg") )
			image_tag("user_uploaded_photos/" + @user.username + ".jpg", id:"profilepic", class:"pull-left") 
		elsif ! @user.photo_url.nil?
			image_tag(@user.photo_url, id:"profilepic",
			 class:"pull-left", size: '430')
		else
			image_tag("default_profile_image.png", id:"profilepic", class:"pull-left")
		end
	end
end
