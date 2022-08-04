# frozen_string_literal: true

class InventorySerializer < ActiveModel::Serializer
  attributes :quantity, :device

  belongs_to :user

  def device
    {
      id: object.device.id,
      name: object.device.name,
      price: object.device.price
    }
  end
end
