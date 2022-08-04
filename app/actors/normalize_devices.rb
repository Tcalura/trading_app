# frozen_string_literal: true

class NormalizeDevices < Actor
  output :user_devices
  output :target_devices

  def call
    self.user_devices = hash_devices(result.dig(:data, :user, :devices), result.user)
    self.target_devices = hash_devices(result.dig(:data, :target_user, :devices), result.target_user)
  end

  private

  def hash_devices(list, user)
    list.group_by { |h| h[:id] }.values.map do |arr|
      {
        device_id: arr[0][:id],
        quantity: arr.sum { |hash| hash[:quantity] },
        user_id: user.id
      }
    end
  end
end
