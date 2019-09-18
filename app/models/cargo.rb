class Cargo < ApplicationRecord
  belongs_to :departure_city, class_name: 'City'
  belongs_to :delivery_city, class_name: 'City'

  after_commit :update_price, unless: :price?

  validates :length, presence: true, numericality: true
  validates :width, presence: true, numericality: true
  validates :height, presence: true, numericality: true
  validates :total_volume, presence: true, numericality: true
  validates :total_weight, presence: true, numericality: true

  validates :departure_city_id, presence: true, numericality: true
  validates :delivery_city_id, presence: true, numericality: true

  validate :ensure_cities_are_different

  private

  def update_price
    update!(price: calculated_price)
  end

  def calculated_price
    500 + distance_between_cities * measurements
  end

  def distance_between_cities
    Geocoder::Calculations
      .distance_between([departure_city.latitude,departure_city.longitude],
                        [delivery_city.latitude,delivery_city.longitude]).to_i
  end

  def measurements
    length + width + height + total_volume + total_weight
  end

  def ensure_cities_are_different
    return if departure_city_id != delivery_city_id
    errors.add(:base, 'Города не должны совпадать!')
  end
end
