# frozen_string_literal: true

class Merchant < ApplicationRecord
  enum :disbursement_frequency, { daily: 0, weekly: 1 }
  validates :reference, presence: true, uniqueness: true
end
