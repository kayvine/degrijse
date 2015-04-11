class WorksController < InheritedResources::Base
	before_filter :basic_authenticate, only: [:new, :create]

	def show
		@work = Work.find(params[:id])
		@categories = @work.category.name
	end
	def new
		@work = Work.new
		@categories = Category.all.map{ |c| [ c.name, c.id ] }
	end

	def edit
		@work = Work.find(params[:id])
		@categories = Category.all.map{|c| [ c.name, c.id ] }
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
		params.require(:work).permit(:title, :description, :category_id)
	end

end

