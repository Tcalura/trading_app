# frozen_string_literal: true

class CreateInventories < Actor
  input :devices

  output :inventories

  def call
    devices.each do |hash|
      device = Device.find(hash[:id])
      self.inventories = Inventory.create({
                                            user: result.user,
                                            device: device,
                                            quantity: hash[:quantity]
                                          })
    end
  rescue ActiveRecord::RecordNotFound
    fail!(error: 'Device not found')
  rescue Exception => e
    fail!(error: 'Invalid Parameters for create inventory')
  end
end
