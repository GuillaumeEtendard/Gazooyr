class News < ApplicationRecord

  belongs_to :user, optional: true

  has_many :comments
  accepts_nested_attributes_for :comments

  validates :title,
            :presence => true
  validates_length_of :title, :minimum => 5
  validates_length_of :content, :minimum => 5

end
