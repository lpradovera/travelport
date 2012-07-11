module Travelport::Response
	class LowFareSearchRsp < Base

    attr_accessor :flight_details_list
    attr_accessor :air_segment_list
    attr_accessor :fare_info_list
    attr_accessor :pricing_solutions

    def process
      process_raw_flight_details_list(raw_content[:flight_details_list])
      process_raw_air_segment_list(raw_content[:air_segment_list])
      process_raw_fare_info_list(raw_content[:fare_info_list])
      process_raw_route_list(raw_content[:route_list])
      process_raw_air_pricing_solution(raw_content[:air_pricing_solution])
    end

    def process_raw_flight_details_list(list)
      self.flight_details_list = Hash[list[:flight_details].map do |flight_details|
        [flight_details[:@key], Travelport::Model::FlightDetails.new(flight_details)]
      end]
    end

    def process_raw_air_segment_list(list)
      self.air_segment_list = Hash[list[:air_segment].map do |air_segment|
        [air_segment[:@key], Travelport::Model::AirSegment.new(air_segment)]
      end]
    end

    def process_raw_fare_info_list(list)
      self.fare_info_list = Hash[list[:fare_info].map do |fare_info|
        [fare_info[:@key], Travelport::Model::FareInfo.new(fare_info)]
      end]
    end

    def process_raw_route_list(list)
    end

    def process_raw_air_pricing_solution(pricing_solutions)
      self.pricing_solutions = Hash[pricing_solutions.map do |pricing_solution|
        [pricing_solution[:@key], Travelport::Model::PricingSolution.new(pricing_solution)]
      end]
    end

    protected
    def raw_content
      @raw_content[:low_fare_search_rsp]
    end
	end
end