require 'active_support/concern'
module Travelport::Model
  module BlockInitialization
    extend ActiveSupport::Concern

    def initialize(*)
      super
      yield self if block_given?
    end
  end
end