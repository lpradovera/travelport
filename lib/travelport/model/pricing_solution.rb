module Travelport::Model
  class PricingSolution < Base
    attr_accessor :air_segment_ref,
                  :leg_ref,
                  :air_pricing_info,
                  :connection,
                  :key,
                  :total_price,
                  :base_price,
                  :approximate_total_price,
                  :approximate_base_price,
                  :equivalent_base_price,
                  :taxes

    def total_price=(price)
      @total_price = to_price(price)
    end

    def base_price(price)
      @base_price = to_price(price)
    end

    def approximate_total_price=(price)
      @approximate_total_price = to_price(price)
    end

    def approximate_base_price=(price)
      @approximate_base_price = to_price(price)
    end

    def equivalent_base_price=(price)
      @equivalent_base_price = to_price(price)
    end

    def air_segment_ref=(air_segment)
      air_segment = air_segment.kind_of?(Array) ? air_segment : [air_segment]
      @air_segment_ref = air_segment.map { |as| as[:@key] }
    end

    def leg_ref=(leg_ref)
      leg_ref = leg_ref.kind_of?(Array) ? leg_ref : [leg_ref]
      @leg_ref = leg_ref.map { |lr| lr[:@key] }
    end

    def connection=(connection)
      connection = connection.kind_of?(Array) ? connection : [connection]
      @connection = connection.map { |connection| connection[:@segment_index] }
    end
  end
end