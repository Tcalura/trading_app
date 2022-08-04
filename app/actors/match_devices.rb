# frozen_string_literal: true

class MatchDevices < Actor
  def call
    user_total = result.user_inventories.sum { |inventory| inventory[:price] * inventory[:quantity] }
    target_total = result.target_inventories.sum { |inventory| inventory[:price] * inventory[:quantity] }

    fail!(error: 'invalid values') unless user_total == target_total

    result.user_inventories.each do |hash|
      if hash[:quantity] == hash[:inventory].quantity
        delete(hash[:inventory])
      else
        subtract_quantity(hash)
      end
      create_inventory(result.user, result.target_inventories)
    end

    result.target_inventories.each do |hash|
      if hash[:quantity] == hash[:inventory].quantity
        delete(hash[:inventory])
      else
        subtract_quantity(hash)
      end
      create_inventory(result.target_user, result.user_inventories)
    end
  end

  def delete(inventory)
    inventory.destroy
  end

  def subtract_quantity(hash)
    hash[:inventory].update(quantity: hash[:inventory].quantity - hash[:quantity])
  end

  def create_inventory(user, arr)
    arr.each do |hash|
      inventory = Inventory.find_by('device_id = :device_id and user_id = :user_id',
                                    { device_id: hash[:inventory].device_id, user_id: user.id })

      if inventory.nil?
        user.inventories.create!({
                                   user_id: user.id,
                                   device_id: hash[:inventory].device_id,
                                   quantity: hash[:quantity]
                                 })
      else
        inventory.update(quantity: inventory.quantity + hash[:quantity])
      end
    end
  end
end
