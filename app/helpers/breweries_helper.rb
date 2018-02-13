module BreweriesHelper
  def google_map(center)
    "https://maps.googleapis.com/maps/api/staticmap?center=#{center}&size=300x300&zoom=16&markers=color:blue%7Clabel:S%7C11211%7C11206%7C11222&key=AIzaSyB8-iEEA12m7RXqHbloTWZc7bl0CZVbKYk"
  end
end
