# frozen_string_literal: true

class Entity < ApplicationRecord
  belongs_to :user
  belongs_to :group, dependent: :destroy

  validates :name, presence: true, length: { maximum: 50 }
  validates :amount, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
