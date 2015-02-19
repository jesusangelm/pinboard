class Category < ActiveRecord::Base
  has_many :pins

  validates :name, :description, presence: true
end
