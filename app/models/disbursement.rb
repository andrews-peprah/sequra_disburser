class Disbursement < ApplicationRecord
  belongs_to :merchant
  belongs_to :order
end
