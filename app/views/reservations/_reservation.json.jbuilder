json.extract! reservation, :id, :booking_code, :from_date, :to_date, :property_id, :review_id, :created_at, :updated_at
json.url reservation_url(reservation, format: :json)
