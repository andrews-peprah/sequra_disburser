# frozen_string_literal: true

class Order < ApplicationRecord
  validates :merchant, presence: true
  belongs_to :merchant, required: true

  monetize :amount_in_cents, as: 'amount'
end
