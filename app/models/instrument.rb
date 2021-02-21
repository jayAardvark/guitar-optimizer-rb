class Instrument < ApplicationRecord
  has_many :repairs

  before_create :slugify

  def slugify
    self.slug = name.parameterize
  end
end
