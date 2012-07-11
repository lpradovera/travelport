require 'spec_helper'
require 'travelport'
require 'active_support/all'

describe Travelport::Bridge::Air do
  before :all do
    Travelport.config.login = "Universal API/uAPI-851375684"
    Travelport.config.password = "rZSgRWpPPYb6njF8SKBrnA9cK"
    Travelport.config.target_branch = "P105215"
    Travelport.config.point_of_sale = "Kopernicus"
    Travelport.config.document_dir = File.absolute_path('./wsdl')
    Travelport.config.endpoint = "https://emea.copy-webservices.travelport.com/B2BGateway/connect/uAPI/Service"
  end

  let :bridge do Travelport::Bridge::Air.new end

  context 'general search query' do
    use_vcr_cassette
    it 'should send base search request' do
      resp = bridge.low_fare_search([{from:'IEV', to:'NYC', at:Time.new + 5.days }, {from:'NYC', to:'IEV', at:Time.new+10.days}], {adults:1, cabin:'Economy'})
      resp.should be_instance_of(Travelport::Response::LowFareSearchRsp)
    end
  
  end
end