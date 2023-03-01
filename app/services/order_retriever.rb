# frozen_string_literal: true

require 'open-uri'
require 'csv'

class OrderRetriever < ApplicationService
  def call
    # <CSV::Row "merchant_reference;amount;created_at":"wintheiser_bernhard;26.71;2022-10-08">
    CSV.parse(URI.open(ENV['ORDER_URL']), headers: true, col_sep: ';').each_slice(500) do |batch|
      batch.each do |hash|
        merchant = Merchant.find_by reference: hash['merchant_reference']
        next unless merchant.present?

        order = merchant.orders.new(created_at: hash['created_at'])
        order.amount = hash['amount']
        order.save!
      end
    end
  end
end
