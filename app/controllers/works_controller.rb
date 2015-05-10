class WorksController < InheritedResources::Base
	before_filter :basic_authenticate, only: [:new, :create, :destroy]
	before_action :set_work, only: [:show, :edit, :update, :destroy]

	# GET /works
	# GET /works.json
	def index
		@works = Work.all
	end

	# GET /works/1
	# GET /works/1.json
	def show
		@categories = @work.category.name
	end

	# GET /works/new
	def new
		@work = Work.new
		@categories = Category.all.map{ |c| [ c.name, c.id ] }
	end

	# POST /works
	# POST /works.json
	def create
		@work = Work.new(work_params)
		# @work.category_id = params[:category_id]

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

	# GET /works/1/edit
	def edit
		@categories = Category.all.map{ |c| [ c.name, c.id ] }
	end

	# PATCH/PUT /works/1
	# PATCH/PUT /works/1.json
	def update
	@work.category_id = params[:category_id]
		respond_to do |format|
			if @work.update(work_params)
				format.html { redirect_to @work, notice: 'work was successfully updated.' }
				format.json { render :show, status: :ok, location: @work }
			else
				format.html { render :edit }
				format.json { render json: @work.errors, status: :unprocessable_entity }
			end
		end
	end

	# DELETE /works/1
	# DELETE /works/1.json
	def destroy
		@work.destroy
		respond_to do |format|
			format.html { redirect_to works_url, notice: 'work was successfully destroyed.' }
			format.json { head :no_content }
		end
	end

	private
		# Use callbacks to share common setup or constraints between actions.
		def set_work
			@work = Work.find(params[:id])
		end

		# Never trust parameters from the scary internet, only allow the white list through.
		def work_params
			params.require(:work).permit(:id, :title, :description, :year, :category_id, 
				photos_attributes: [:id, :title, :image, :_destroy])
		end
end
