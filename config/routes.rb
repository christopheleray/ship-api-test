Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1', defaults: { format: :json} do
      resources :companies, only: [:index]
      resources :products, only: [:index]
      resources :shipments, only: [:index]
      resources :shipment_products, only: [:index]
    end
  end
end
