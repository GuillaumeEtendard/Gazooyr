class Gazooy < ApplicationRecord
  belongs_to :user, optional: true

  has_many :hash_tags

  after_create :make_hash_tags

  private
  def make_hash_tags
    array = self.text.scan(/#\w+/).flatten
    array.each do |h|
      hash = HashTag.new
      h.slice! "#"
      hash.name = h
      hash.gazooy = self
      hash.save!
    end
  end
end
