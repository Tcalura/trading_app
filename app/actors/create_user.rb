# frozen_string_literal: true

class CreateUser < Actor
  input :name, type: String
  input :user_name, type: String
  input :email,     type: String
  input :birthdate, type: String
  input :vacation

  output :user

  def call
    self.user = User.create({
                              name: name,
                              user_name: user_name,
                              email: email,
                              birthdate: birthdate.to_date,
                              vacation: vacation,
                              country: result.country
                            })
  rescue StandardError
    fail!(error: 'Invalid Parameters for create user')
  end

  def rollback
    user.destroy
  end
end
