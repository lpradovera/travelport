module Travelport::Bridge
  class Air < Base
  
    default_for :service, 'AirService'
    default_for :document, 'air_v18_0/Air.wsdl'

    def low_fare_search(sectors, options)
      options.assert_valid_keys(:adults, :children, :infants, :cabin)
      req = Travelport::Request::LowFareSearchReq.new do |obj|
        obj.sectors = sectors
        obj.children = options[:children]
        obj.infants = options[:infants]
        obj.cabin = options[:cabin]
      end
      Travelport::Response::LowFareSearchRsp.new(send_request(req))
    end

  end
end