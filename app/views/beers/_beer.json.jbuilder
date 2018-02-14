json.extract! beer, :id, :name, :description, :style_id, :abv, :brewery_id, :created_at, :updated_at
json.url beer_url(beer, format: :json)
