ActiveAdmin.register Work do
	permit_params :title, :description, :year, :place, :category_id, 
			photos_attributes: [:id, :title, :image, :_destroy]

	form :html => { :enctype => "multipart/form-data" } do |f|
		f.inputs do
			f.input :title, label: "Titel"
			f.input :description, label: "Beschrijving"
			f.input :year, label: "Jaar", as: :select, collection: 2007..Date.today.year
			f.input	:place, label: "Plaats"
			f.input	:category, label: "Categorie"
			f.has_many :photos, heading: "Foto's" do |p|
				p.input :title, label: "Afbeelding titel"
				p.input :image, as: :file, label: "Afbeelding", hint: image_tag(p.object.image.url(:thumb))
				p.input :_destroy, as: :boolean, required: false, label: 'Verwijder foto'
			end
		end
			# f.inputs :for => :photos, allow_destroy: true, new_record: false do |p|
			# 	p.input :image, :as => :file, input_html: { multiple: true}, :hint => p.template.image_tag(p.object.image.url(:thumb))
			# 	p.input :_destroy, :as=>:boolean, :required => false, :label => 'Remove photo'
			# end
		f.actions
	end

	index do
		column :title
		column :description
		column :year
		column :place
		column :category
		actions
	end

	# index as: :grid do |work|
	# 	link_to image_tag(work.image.url(:thumb)), admin_work_path(work)
	# end

	show do
		panel "Photos" do
			table_for work.photos do
				column :title
				column :image do |p|
					image_tag p.image.url(:medium)
				end
				# ...
			end
		end
	end
	sidebar "Work Information", only: [:show] do
		attributes_table_for work do
			row :description
			row :year
			row :place
			row :category
		end
	end

	ActiveAdmin.register Photo do
	  belongs_to :work
	end

end