# frozen_string_literal: true

class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :user_name, :email,
             :birthdate, :vacation, :country

  has_many :inventories

  def country
    object.country.name
  end
end
