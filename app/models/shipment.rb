class Shipment < ApplicationRecord
  belongs_to :company
  has_many :shipment_products
  has_many :products, :through => :shipment_products
  validates :name, :company_id, :international_transportation_mode, :international_departure_date, presence: true
end
