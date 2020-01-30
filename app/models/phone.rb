class Phone < ApplicationRecord
	before_create :assign_unique_number

	private

		NUMBER_RANGE = (1111111111..9999999999)

		def assign_unique_number
			if self.phone.present? && !Phone.exists?(phone: self.phone) && NUMBER_RANGE.include?(self.phone)
				self.phone = self.phone
			else
			  self.phone = loop do
			    phone = rand(NUMBER_RANGE)
			    break phone unless Phone.exists?(phone: phone)
			  end
			end
		end
end
