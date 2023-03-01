# frozen_string_literal: true

class Order < ApplicationRecord
  validates :merchant, presence: true
  belongs_to :merchant, required: true

  monetize :amount_in_cents, as: 'amount'

  include AASM

  aasm do
    state :pending, initial: true
    state :disbursed

    event :disburse, after_commit: :save_disbursement do
      transitions from: :pending, to: :disbursed
    end
  end

  def save_disbursement
    pp 'disbursement'
  end
end
