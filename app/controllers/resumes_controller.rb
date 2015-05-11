class ResumesController < InheritedResources::Base
	before_filter :basic_authenticate, only: [:new, :create, :destroy]

  private

    def resume_params
      params.require(:resume).permit(:title, :year, :location, :text, :artists, :curator, :link)
    end
end

