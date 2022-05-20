class Genre < ApplicationRecord
  # validation
  validates :name,
            presence: true,
            length: { maximum: 50 }

  # relation
  has_many :artists
end
