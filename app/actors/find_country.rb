# frozen_string_literal: true

class FindCountry < Actor
  input :country_id
  output :country

  def call
    self.country = Country.find(country_id)
  rescue ActiveRecord::RecordNotFound
    fail!(error: 'Country not found')
  end
end
