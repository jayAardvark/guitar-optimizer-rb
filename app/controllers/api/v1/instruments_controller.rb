# namespace in modules to correspond with namespacing in routes
module Api
  module V1
    class InstrumentsController < ApplicationController
      def index
        instruments = Instrument.all

        render json: InstrumentSerializer.new(instruments, options).serializable_hash.to_json
      end

      def show
        instrument = Instrument.find_by(slug: params[:slug])

        render json: InstrumentSerializer.new(instrument, options).serializable_hash.to_json
      end

      def create
        instrument = Instrument.new(instrument_params)

        if instrument.save
          render json: InstrumentSerializer.new(instrument).serializable_hash.to_json
        else
          render json: { error: instrument.errors.messages }, status: 422
        end
      end

      def update
        instrument = Instrument.find_by(slug: params[:slug])

        if instrument.update(instrument_params)
          render json: InstrumentSerializer.new(instrument, options).serializable_hash.to_json
        else
          render json: { error: instrument.errors.messages }, status: 422
        end
      end

      def destroy
        instrument = Instrument.find_by(slug: params[:slug])

        if instrument.destroy
          head :no_content
        else
          render json: { error: instrument.errors.messages }, status: 422
        end
      end

      private

      def instrument_params
        params.require(:instrument).permit(:name, :instrument_notes)
      end

      # jsonapi-serializer allows access to associated repairs-data for  
      # a given instrument via Compound Documents. use a Compound Document 
      # to structure the json response. include this "options" instance variable 
      #  hash when initializing the serializers above
      def options
        @options ||= { include: %i[repairs]}
      end
    end
  end
end
