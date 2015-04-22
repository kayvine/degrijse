ActiveAdmin.register_page "Dashboard" do

	menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

	content title: proc{ I18n.t("active_admin.dashboard") } do
		# section class: "blank_slate_container", id: "dashboard_default_message" do
		# 	span class: "blank_slate" do
		# 		span I18n.t("active_admin.dashboard_welcome.welcome")
		# 		small I18n.t("active_admin.dashboard_welcome.call_to_action")
		# 	end
		# end
		
		section do
		  h3 "Your recent works"
		  table_for Work.order("created_at desc").limit(5) do
		    column :title
		    column :created_at
		  end
		  strong { link_to "View All Works", admin_works_path }
		end

		section do
		  h3 "Your recent blogs"
		  table_for Blog.order("created_at desc").limit(5) do
		    column :blog_title
		    column :created_at
		  end
		  strong { link_to "View All Blogs", admin_blogs_path }
		end
	end

	# ActiveAdmin.build do
	# 	section "Your recent works" do
	# 		table_for current_admin_user.works.recent(5).map do |work|
	# 			t.column("Title") { |work| link_to work.title, admin_work_path(work) }
	# 			t.column("Description") { |work| work.description }
	# 			t.column("Category") { |work| link_to work.category_id, admin_category_path(work) }
	# 		end
	# 	end
	 
end