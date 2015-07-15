module ApplicationHelper
	
	def flash_class (type)
		case type
		when 'alert'
			"alert-danger"
		when 'notice'
			"alert-success"
		else
			"alert-warning"
		end
	end

	def post_foto (post)
		html = ""
		if post.image 
			html << link_to("clique para ver foto", @post.image.url)
			return html.html_safe
		end
	end

		def lost_foto (lost)
		html = ""
		if lost.photo 
			html << link_to(@lost.photo_file_name, @lost.photo.url)
			return html.html_safe
		end
	end

	def post_contagem
		Post.all.count
	end

	  def resource_name
	    :user
	  end
	 
	  def resource
	    @resource ||= User.new
	  end
	 
	  def devise_mapping
	    @devise_mapping ||= Devise.mappings[:user]
	  end

	  def og_image_path 
	  	if request.env['PATH_INFO'] == adotar_path
        @og_image_path = "http://encontrepet.com/encontrepet3.png"
        elsif request.env['PATH_INFO'] == posts_path
        @og_image_path = "http://encontrepet.com/encontrepet3.png"
        elsif request.env['PATH_INFO'] == "/" 
        @og_image_path = "http://encontrepet.com/encontrepet3.png"
        else
        @og_image_path = @post.image.url
        end    
	  end

end
