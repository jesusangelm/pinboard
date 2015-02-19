class Pin < ActiveRecord::Base
  acts_as_votable

  belongs_to :user
  belongs_to :category

  validates :title, :description, :user_id, :category_id, presence: true

  has_attached_file :image, styles: { medium: "300x300"}

  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end
