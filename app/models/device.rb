# frozen_string_literal: true

class Device < ApplicationRecord
  has_many :inventories, dependent: :destroy
  has_many :users, through: :inventories
end
