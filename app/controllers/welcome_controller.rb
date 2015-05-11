class WelcomeController < ApplicationController
	before_filter :initialize_message

	def index
		@works = Work.all
		@blogs = Blog.all
		@resumes = Resume.all.order(year: :desc)
		@resumes_years = @resumes.group_by { |t| t.year }
	end

	def new
		@works = Work.all
		@blogs = Blog.all
		@message = Message.new
	end

	def create
		@works = Work.all
		@blogs = Blog.all
		@message = Message.new(message_params)
		if @message.valid?
			# Tell the messageMailer to send a new message if valid
			MessageMailer.new_message(@message).deliver_now
			flash.now[:success] = "Joepie, je bericht is verzonden!"
			# redirect_to root_path(anchor: "contact"), succes: 'Joepie, je bericht is verzonden!'
		else
			# redirect_to root_path(anchor: "contact"), danger: 'Oeps, er is iets fout gelopen.'
			# flash.now[:danger] = "Oeps, er is iets fout gelopen."
			flash.now[:danger] = "Oeps, er is iets fout gelopen."
		end
		render 'index'
	end

	private
	# Use callbacks to share common setup or constraints between actions.
	def initialize_message
		@message = Message.new
	end

	def message_params
		params.require(:message).permit(:name, :email, :content)
	end

end