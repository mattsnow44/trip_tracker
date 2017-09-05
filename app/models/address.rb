class Address < ApplicationRecord
  belongs_to :location

  def raw_street_address
    "#{street} #{city} #{state} #{zip}"
  end
end
