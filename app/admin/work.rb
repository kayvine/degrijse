ActiveAdmin.register Work do
	permit_params :title, :description, :category_id, photos_attributes: [:id, :image, :_destroy]

	form :html => { :enctype => "multipart/form-data" } do |f|
		f.inputs do
			f.input :title, label: "Titel"
			f.input :description, label: "Beschrijving"
			f.input	:category, label: "Categorie"
		end
		f.has_many :photos, heading: "Foto's" do |p|
			p.input :image, as: :file, label: "Afbeelding", hint: image_tag(p.object.image.url(:thumb))
		end

		# f.inputs :for => :photos, allow_destroy: true, new_record: false do |p|
		# 	p.input :image, :as => :file, input_html: { multiple: true}, :hint => p.template.image_tag(p.object.image.url(:thumb))
		# 	p.input :_destroy, :as=>:boolean, :required => false, :label => 'Remove photo'
		# end

		# f.inputs for: :photos do |p|
		# 	if p.object.new_record?
		# 		p.input :image, :as => :file
		# 	else
		# 		p.input :image, :as => :file, :hint => p.template.image_tag(p.object.image.url(:thumb))
		# 	end
		# end

		# 	f.has_many :photos  do |p|
		# 		p.input :photo, :as => :file, :hint => p.template.image_tag(p.object.photo.url(:thumb)) 
		# 		p.input :_destroy, :as=>:boolean, :required => false, :label => 'Remove photo'
		# 	end
		# end

		f.actions
	end

	config.comments = false

end