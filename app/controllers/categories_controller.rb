class CategoriesController < InheritedResources::Base
  before_filter :authenticate, :only => [:create, :destroy, :new]

  def new
    @category = Category.new
  end
 
  def create
    @category = Category.create(category_params)
    if @category.save
      flash[:success] = "category created!"
      redirect_to root_path
    else
      render :action => "new"
    end
  end
   
  def destroy
  end
 
  private

    def category_params
      params.require(:category).permit(:name)
    end
end

