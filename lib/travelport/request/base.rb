require 'active_model'
require 'nokogiri'

module Travelport::Request
  class Base

    include Travelport::Model::DefaultFor
    include Travelport::Model::BlockInitialization
    include Travelport::Model::AttributeMethods
    include ActiveModel::Validations

    attr_accessor :trace_id
    attr_accessor :token_id
    attr_accessor :authorized_by
    attr_accessor :target_branch
    attr_accessor :override_loggging
    attr_accessor :billing_point_of_sale
    attr_accessor :agent_id_override
    attr_accessor :xmlns

    validates_presence_of :target_branch
    validates_presence_of :billing_point_of_sale

    def request_body
      raise Travelport::Exceptions::GenerationException, "Don't know how to generate request for #{request_name}"
    end

    def request_attributes
      Hash[attributes.except(:agent_id_override, :errors, :billing_point_of_sale).map do |key, value|
        [key.to_s.camelize, value]
      end]
    end

    def request_name
      self.class.name.split("::").last
    end
  
  end
end