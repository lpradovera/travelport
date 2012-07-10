module Travelport::Request
	class LowFareSearchReq < Base

		attr_accessor :sectors
		attr_accessor :adults
		attr_accessor :children
		attr_accessor :infants
		attr_accessor :cabin

		default_for :adults, 1
		default_for :infants, 1
		default_for :children, 1
		default_for :cabin, 'Economy'
		default_for :xmlns, 'http://www.travelport.com/schema/air_v18_0'

		validates_presence_of :sectors
		validates_presence_of :adults

		validates_inclusion_of :cabin, in:[nil, 'Economy', 'Bussines', 'Premium Economy', 'First']

		validate :each_sector

		def request_attributes
			super.except('Sectors', 'Cabin', 'Xmlns', 'Adults', 'Children', 'Infants').update(:xmlns => xmlns)
		end

		protected
		def each_sector
			errors.add(:sectors, "can't be empty") if sectors.nil? || sectors.empty?
			sectors.each do |sector|
				errors.add(:sectors, "#{sector.inspect} should contain attribute :from") if sector[:from].nil?
				errors.add(:sectors, "#{sector.inspect} should contain attribute :to") if sector[:to].nil?
				errors.add(:sectors, "#{sector.inspect} should contain attribute :at") if sector[:at].nil?
				unless sector[:at].nil?
					errors.add(:sectors, "#{sector.inspect} attribute :at should be instance of Time") unless sector[:at].kind_of?(Time)
				end
			end unless sectors.nil?
		end
	end
end