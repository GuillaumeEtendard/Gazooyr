class Page < ApplicationRecord
  before_create :make_slug
  private

  def make_slug
    self.slug = self.title.parameterize
  end
end
