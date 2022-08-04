# frozen_string_literal: true

class FindUsers < Actor
  output :user
  output :target_user

  def call
    self.user = User.find(result.dig(:data, :user, :user_id))
    self.target_user = User.find(result.dig(:data, :target_user, :user_id))

    fail!(error: 'User is on vacation') if target_user.vacation
  rescue ActiveRecord::RecordNotFound => e
    fail!(error: e.message)
  end
end
