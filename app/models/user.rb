# frozen_string_literal: true

class User < ApplicationRecord
  belongs_to :country
  has_many :inventories, dependent: :destroy
  has_many :devices, through: :inventories

  scope :available, ->(vacation) { where(vacation: !vacation) }

  def total_devices
    inventories.sum(&:quantity)
  end
end
