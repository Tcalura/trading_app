# frozen_string_literal: true

class CreateUserFlow < Actor
  play FindCountry,
       CreateUser,
       CreateInventories
end
