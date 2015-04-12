class WorksController < InheritedResources::Base
	before_filter :basic_authenticate, only: [:new, :create]

	def index
		@works = Work.all
		# @photos = Photo.all.map{ |p| [ p.image, p.id ] } # waarschijnlijk fout
	end
	def show
		@work = Work.find(params[:id])
		@categories = @work.category.name
		# @photos = @work.photo.image # waarschijnlijk fout
	end
	def new
		@work = Work.new
		@categories = Category.all.map{ |c| [ c.name, c.id ] }
		3.times {@work.photos.build} # create 3 file upload boxes
	end

	def edit
		@work = Work.find(params[:id])
		@categories = Category.all.map{|c| [ c.name, c.id ] }
		3.times { @work.photos.build } # ... and this
	end

	def create 
		@work = Work.create(work_params)
		@work.category_id = params[:category_id]
		respond_to do |format|
		  if @work.save
			format.html { redirect_to @work, notice: 'work was successfully created.' }
			format.json { render :show, status: :created, location: @work }
		  else
			format.html { render :new }
			format.json { render json: @work.errors, status: :unprocessable_entity }
		  end
		end
	end

	def update
		@work = Work.find(params[:id])
		@work.category_id = params[:category_id]
		if @work.update(work_params)
		  redirect_to @work
		else
		  render 'edit'
		end
	end

	private
	def work_params
		params.require(:work).permit(:title, :description, :category_id, photos_attributes: [:title, :image, :id])
	end

end

