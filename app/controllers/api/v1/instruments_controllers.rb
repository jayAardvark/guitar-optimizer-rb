module Api
  module v1
    class InstrumentsController < ApplicationController
      def index
      instruments = Instrument.all

      render json: InstrumentSerializer.new(instruments, options).serializable_hash.to_json
      end
  end
end

