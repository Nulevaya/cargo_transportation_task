json.(@cargo,
      :id,
      :length,
      :width,
      :height,
      :total_volume,
      :total_weight,
      :price)
json.departure_city_name @cargo.departure_city.name
json.delivery_city_name @cargo.delivery_city.name