require 'savon'
module Travelport::Bridge
	class Base

		include Travelport::Model::DefaultFor

		attr_accessor :document
		attr_accessor :service

		def send_request(req_obj)
			req_obj.target_branch = Travelport.config.target_branch
			req_obj.billing_point_of_sale = Travelport.config.point_of_sale
			raise Travelport::Exceptions::BadRequest, "Request #{req_obj.request_name} is wrong(#{req_obj.errors.to_a})" unless req_obj.valid?
			client.request(req_obj.request_name, req_obj.request_attributes) do
				http.headers['SOAPAction'] = ""
				soap.body = req_obj.request_body
			end
		end

		protected
		def client
			@client ||= Savon::Client.new do
				wsdl.endpoint = Travelport.config.endpoint.gsub('Service', service)
				wsdl.document = File.join(Travelport.config.document_dir, document)
				http.auth.ssl.verify_mode = :none
				http.auth.basic(Travelport.config.login, Travelport.config.password)
			end
		end
	end
end