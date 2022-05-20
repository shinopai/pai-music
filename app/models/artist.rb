class Artist < ApplicationRecord
  # validation
  validates :name,
            presence: true,
            length: { maximum: 50}
  validates :spotify_id,
            presence: true
            # format: { with: /^(?=.*?[a-z])(?=.*?[A-Z])(?=.*?\d)[a-zA-Z\d]{8,100}$/ }
  validates :image,
            format: { with: /\A#{URI::regexp(%w(http https))}\z/ }
  validates :spotify_url,
            presence: true,
            format: { with: /\A#{URI::regexp(%w(http https))}\z/ }

  #relation
  belongs_to :user
  belongs_to :genre, optional: true
end
