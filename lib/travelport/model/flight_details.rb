require 'active_support/all'
module Travelport::Model
  class FlightDetails < Base

    attr_accessor :key,
                  :origin,
                  :destination,
                  :departure_time,
                  :arrival_time,
                  :flight_time,
                  :travel_time,
                  :equipment,
                  :origin_terminal,
                  :destination_terminal

    def departure_time=(time)
      @departure_time = time.to_time
    end

    def arrival_time=(time)
      @arrival_time = time.to_time
    end
    
  end
end