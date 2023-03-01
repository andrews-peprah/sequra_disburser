# frozen_string_literal: true

class MerchantRetrievalJob
  include Sidekiq::Worker
  def perform
    MerchantRetriever.call
  end
end
