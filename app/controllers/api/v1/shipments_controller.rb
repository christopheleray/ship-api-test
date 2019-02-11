module Api
  module V1
    class ShipmentsController < ApplicationController

      def index 
        if params[:company_id].present?
          @shipments = Shipment.where(company_id: params[:company_id]).includes(:shipment_products)
          
          if (params[:sort].present?)
            @shipments = @shipments.order( "shipments." + params[:sort] + " " + (params[:direction].present? ? params[:direction] : "asc") )
          end

          if (params[:international_transportation_mode].present?)
            @shipments = @shipments.select { |shipment| shipment.international_transportation_mode == params[:international_transportation_mode] }
          end

          if (params[:page].present?)
            @shipments = Kaminari.paginate_array(@shipments).page(params[:page]).per( (params[:per].present? ? params[:per] : 4) )
          else
            @shipments = Kaminari.paginate_array(@shipments).page(1).per(4)
          end
        else
          render json: {errors:  ["company_id is required"] }, status: 422 
        end
      end

    end
  end
end
