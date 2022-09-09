class Group < ApplicationRecord
  belongs_to :user
  has_one_attached :icon
  has_many :entities, dependent: :destroy

  validates :name, presence: true, length: { maximum: 50 }
  validates :icon, presence: true
end
