# frozen_string_literal: true

class Merchant < ApplicationRecord
  enum :disbursement_frequency, { daily: 0, weekly: 1 }
  monetize :minimum_monthy_fee_in_cents, as: 'minimum_monthly_fee'

  validates :reference, presence: true, uniqueness: true

  has_many :orders, dependent: :destroy
end
