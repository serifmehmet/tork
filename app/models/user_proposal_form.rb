class UserProposalForm < ActiveRecord::Base
	belongs_to :brand
	belongs_to :brand_make

	scope :sorted, lambda {order("user_proposal_forms.created_at ASC")}

	def full_name
		first_name + ' ' + last_name
	end

	def random_form_number
		([*('A'..'Z'),*('0'..'9')]-%w(0 1 I O)).sample(8).join
	end
end
