# frozen_string_literal: true

require 'open-uri'
require 'csv'

class OrderRetriever < ApplicationService
  attr_accessor :ref

  def call
    # <CSV::Row "merchant_reference;amount;created_at":"wintheiser_bernhard;26.71;2022-10-08">
    prev_ref = ''
    merchant = nil
    CSV.parse(URI.open(ENV['ORDER_URL']), headers: true, col_sep: ';').each_slice(5000) do |batch|
      orders = []
      batch.each do |hash|
        unless prev_ref == hash['merchant_reference']
          prev_ref = hash['merchant_reference']
          merchant = Merchant.find_by reference: prev_ref
        end
        next unless merchant.present?

        order = merchant.orders.new(created_at: hash['created_at'])
        order.amount = hash['amount']
        orders << order
      end

      Order.import orders
    end
  end
end
