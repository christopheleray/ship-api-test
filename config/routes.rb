Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do
      resources :companies, only: [:index]
      resources :products, only: [:index]
      resources :shipments, only: [:index]
      resources :shipment_products, only: [:index]
    end
  end
end
