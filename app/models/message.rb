class Message < ActiveRecord::Base

  validates :name, :email, :content, presence: true
  validates_format_of :email, with: /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i, message: "Enter a valid e-mail address"

end