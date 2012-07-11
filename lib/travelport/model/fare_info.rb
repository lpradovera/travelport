module Travelport::Model
  class FareInfo < Base
    
    attr_accessor :baggage_allowance,
                  :fare_rule_key,
                  :key,
                  :fare_basis,
                  :passenger_type_code,
                  :origin,
                  :destination,
                  :effective_date,
                  :departure_date,
                  :amount,
                  :private_fare,
                  :negotiated_fare,
                  :not_valid_before,
                  :not_valid_after

  end
end