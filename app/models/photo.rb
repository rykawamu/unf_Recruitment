class Photo < ApplicationRecord
  belongs_to :user
  validates :user_id, presence: true

  default_scope -> { order(created_at: :desc) }
  validates :title, presence: true, length: {maximum: 30}
  validates :picture, presence: true
end
