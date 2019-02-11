json.records do 
  json.array! @shipments do |shipment|
    json.id shipment.id
    json.name shipment.name

    json.products do
      json.array! shipment.shipment_products do |shipment_product|
        json.quantity shipment_product.quantity
        json.id shipment_product.product.id
        json.sku shipment_product.product.sku
        json.description shipment_product.product.description
        json.active_shipment_count shipment_product.id
      end
    end
  end
end
