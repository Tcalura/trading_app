# frozen_string_literal: true

class FindInventories < Actor
  output :user_inventories
  output :target_inventories

  def call
    self.user_inventories = result.user_devices.map do |hash|
      inventory = find_inventory(hash)
      { inventory: inventory, price: inventory&.device&.price, quantity: hash[:quantity] }
    end
    self.target_inventories = result.target_devices.map do |hash|
      inventory = find_inventory(hash)
      { inventory: find_inventory(hash), price: inventory&.device&.price, quantity: hash[:quantity] }
    end

    raise 'Inventory not found' if user_inventories.first[:inventory].nil? || target_inventories.first[:inventory].nil?
  rescue StandardError => e
    fail!(error: e.message)
  end

  def find_inventory(hash)
    Inventory.find_by('device_id = :device_id and
                       user_id = :user_id and
                       quantity >= :quantity', hash)
  end
end
