module Travelport::Model
  class Base
    include AttributeMethods

    def initialize(attributes = {})
      update_attributes(attributes)
    end

    protected
    def to_price(price)
      Travelport::Model::Price.new(price)
    end
  end
end