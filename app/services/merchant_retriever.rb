# frozen_string_literal: true

require 'open-uri'
require 'csv'

class MerchantRetriever < ApplicationService
  def call
    # <CSV::Row "reference;email;live_on;disbursement_frequency;minimum_monthly_fee":"stanton_lang;info@stanton-lang.com;2023-01-16;WEEKLY;30.0">
    CSV.parse(URI.open(ENV['MERCHANT_URL']), headers: true, col_sep: ';').each_slice(500) do |batch|
      batch.each do |hash|
        setup_merchant(hash)
      end
    end
  end

  private

  def setup_merchant(hash)
    merchant = Merchant.new(reference: hash['reference'],
                            email: hash['email'],
                            live_on: hash['live_on'],
                            disbursement_frequency: hash['disbursement_frequency'].to_i)
    merchant.minimum_monthly_fee = hash['minimum_monthly_fee']
    merchant.save!
  end
end
