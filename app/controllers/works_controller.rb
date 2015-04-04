class WorksController < InheritedResources::Base
  before_filter :prepare_categories
  before_filter :basic_authenticate, only: [:new, :create]
 
  def new
	@work = Work.new
  end
 
  def create 
	@work = Work.create(work_params)
	begin
	  @work.save!
	  flash[:success] = "work created!"
	  redirect_to root_path
	rescue Exception => e
	  render :action => 'new'
	end
  end
 
  def destroy
  end
 
 
  private
	def work_params
	  params.require(:work).permit(:title, :description, :category_id)
	end

	# add the @categories = Category.All to the before action so avail for all actions
	def prepare_categories
	  @categories = Category.all
	end

end

