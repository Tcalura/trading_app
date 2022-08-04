# frozen_string_literal: true

class DeviceSerializer < ActiveModel::Serializer
  attributes :id, :name, :price

  has_many :inventories
end
