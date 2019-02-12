class ShipmentProduct < ApplicationRecord
  belongs_to :product
  belongs_to :shipment
  validates :product_id, :shipment_id, :quantity, presence: true
end
