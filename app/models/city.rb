class City < ApplicationRecord
  has_many :departed_cargos, foreign_key: :departure_city_id, class_name: 'Cargo'
  has_many :delivered_cargos, foreign_key: :delivery_city_id, class_name: 'Cargo'

  geocoded_by :name
  after_validation :geocode

  def self.by_departure
    self
      .joins(:departed_cargos)
      .group('cities.id')
      .select('cities.id, cities.name, COUNT(cargos.id) as cargos_count')
      .order('cargos_count DESC')
  end
end
