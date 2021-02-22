# namespace in modules to correspond with namespacing in routes
module Api
  module V1
    class RepairsController < ApplicationController
      # include this for testing via postman before auth is setup
      protect_from_forgery with: :null_session

      def create
        repair = Repair.new(repair_params)

        if repair.save
          render json: RepairSerializer.new(repair).serializable_hash.to_json
        else
          render json: { error: repair.errors.messages }, status: 422
        end
      end

      def destroy
        repair = Repair.find(params[:id])

        if repair.destroy
          head :no_content
        else
          render json: { error: repair.errors.messages }, status: 422
        end
      end

      private

      def repair_params
        params.require(:repair).permit(:date, :repair_description, :instrument_id)
      end
    end
  end
end