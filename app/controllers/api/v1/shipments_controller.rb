module Api
  module V1
    class ShipmentsController < ApplicationController

      def index 
        @shipments = Shipment.where(company_id: params[:company_id]).includes(:shipment_products)
        if (params[:sort].present?)
          @shipments = @shipments.order( "shipments." + params[:sort] + " " + (params[:direction].present? ? params[:direction] : "asc") )
        end
        if (params[:international_transportation_mode].present?)
          @shipments = @shipments.select { |shipment| shipment.international_transportation_mode == params[:international_transportation_mode] }
        end
      end

    end
  end
end
