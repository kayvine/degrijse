class WelcomeController < ApplicationController
	before_action :set_work, only: [:show, :edit, :update, :destroy]

	def index
		@works = Work.all
	end

	private
	# Use callbacks to share common setup or constraints between actions.
	def set_work
		@work = Work.find(params[:id])
	end

end
