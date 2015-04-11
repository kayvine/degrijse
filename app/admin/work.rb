ActiveAdmin.register Work do
	permit_params :title, :description, :category_id,
		photos_attributes: [:id, :image, :_destroy]


end