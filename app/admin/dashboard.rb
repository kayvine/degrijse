ActiveAdmin.register_page "Dashboard" do

	menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

	content title: proc{ I18n.t("active_admin.dashboard") } do
		section class: "blank_slate_container", id: "dashboard_default_message" do
			span class: "blank_slate" do
				span I18n.t("active_admin.dashboard_welcome.welcome")
				small I18n.t("active_admin.dashboard_welcome.call_to_action")
			end
		end

		# Here is an example of a simple dashboard with columns and panels.
		
	# 	columns do
	# 	  column do
	# 	    panel "Recent Works" do
	# 	      ul do
	# 	        Work.recent(5).map do |work|
	# 	          li link_to(work.title, admin_work_path(work))
	# 	        end
	# 	      end
	# 	    end
	# 	  end

	# 	  column do
	# 	    panel "Info" do
	# 	      para "Welcome to ActiveAdmin."
	# 	    end
	# 	  end
	# 	end
	end # content

	# ActiveAdmin.build do
	# 	section "Your recent works" do
	# 		table_for current_admin_user.works.recent(5).map do |work|
	# 			t.column("Title") { |work| link_to work.title, admin_work_path(work) }
	# 			t.column("Description") { |work| work.description }
	# 			t.column("Category") { |work| link_to work.category_id, admin_category_path(work) }
	# 		end
	# 	end
	 
		#section "Your recent posts" do
		#  table_for current_admin_user.posts.recent(5).map do |post|
		#    t.column("Status") { |post| status_tag (task.is_done ? "Done" : "Pending"), (task.is_done ? :ok : :error) }
		#    t.column("Title") { |post| link_to post.title, admin_post_path(post) }
		#    t.column("Assigned To") { |post| post.admin_user.email }
		#    t.column("Due Date") { |post| task.due_date? ? l(task.due_date, :format => :long) : '-' }
		#  end
		#end
	# end
end