class Message

  include ActiveModel::Model
  include ActiveModel::Conversion
  include ActiveModel::Validations

  attr_accessor :name, :email, :content

  validates :name, presence: true

  validates :email, presence: true, format: /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i

  validates :content, presence: true

end