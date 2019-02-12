class Product < ApplicationRecord
  belongs_to :company
  has_many :shipment_products
  has_many :shipments, :through => :shipment_products
  validates :sku, :description, :company_id, presence: true
end
