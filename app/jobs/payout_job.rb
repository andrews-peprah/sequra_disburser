# frozen_string_literal: true

# Payout Job is for calculating the disbursement
class PayoutJob
  include Sidekiq::Worker
  def perform
    DisbursementCalculator.call
  end
end
