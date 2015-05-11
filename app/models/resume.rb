class Resume < ActiveRecord::Base
	validates :title, :year, presence: :true
end
