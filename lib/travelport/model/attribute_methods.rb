require 'active_support/all'
module Travelport::Model::AttributeMethods
	def attributes
		HashWithIndifferentAccess[instance_variables.map do |var|
			[var.to_s.gsub("@", ""), instance_variable_get(var)] unless instance_variable_get(var).nil?
		end.compact]
	end

  def update_attributes(hash)
    hash.each do |key, val|
      self.send("#{key.to_s.gsub('@', '')}=", val)
    end
  end
end