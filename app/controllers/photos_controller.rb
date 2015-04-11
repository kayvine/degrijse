class PhotosController < InheritedResources::Base
	# before_filter :prepare_works
	before_filter :basic_authenticate, only: [:new, :create]
 
	def new
		@photo = Photo.new
	end
 
	def create 
		@photo = Photo.create(photo_params)
		if @photo.save
			flash[:success] = "photo created!"
			redirect_to root_path
		else
			render :action => "new"
		end
	end

	private
		def photo_params
			params.require(:photo).permit(:title, :image, :work_id, works_attributes: [ :id, :title ])
		end
		# add the @categories = Category.All to the before action so available for all actions
		# def prepare_works
		# 	@photos = Work.all
		# end

end
