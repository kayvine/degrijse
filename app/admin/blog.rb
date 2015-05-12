ActiveAdmin.register Blog do

	permit_params :blog_title, :blog_text, :blog_date, :blog_link, :blog_image

	form do |f|
		f.inputs do
			f.input :blog_title, label: "Titel"
			f.input :blog_text, label: "Tekst"
			f.input	:blog_date, order: [:day, :month, :year], label: "Datum"
			f.input	:blog_link, as: :url, label: "Link naar externe website", hint: "Gebruik http://www.voorbeeld.com"
			f.input :blog_image, as: :file, label: "Afbeelding", hint: f.object.blog_image.present? \
				? image_tag(f.object.blog_image.url(:thumb))
				: content_tag(:span, "no cover page yet")
		end
		f.actions
	end

	index do
		column 'Titel', :blog_title
		column 'Omschrijving', :blog_text
		column 'Datum', :blog_date
		# column 'Link', :blog_link
		column 'Afbeelding' do |p|
			image_tag p.blog_image.url(:thumb)
		end
		actions
	end

	show title: :blog_title do
		attributes_table do
			row :blog_text
			row :blog_date, format: :long
			row :blog_link
			row :blog_image do |p|
				image_tag p.blog_image.url(:medium)
			end
		end
	end

	filter :blog_title
	filter :blog_date
	filter :created_at

end
