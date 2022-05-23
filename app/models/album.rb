class Album < ApplicationRecord
  # validation
  validates :name,
            presence: true,
            length: { maximum: 100}
  validates :spotify_id,
            presence: true
  validates :image,
            format: { with: /\A#{URI::regexp(%w(http https))}\z/ }
  validates :spotify_url,
            presence: true,
            format: { with: /\A#{URI::regexp(%w(http https))}\z/ }
  validates :release_date,
            presence: true
  validates :format_type,
            presence: true

  #relation
  belongs_to :user
end
