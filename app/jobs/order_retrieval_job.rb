# frozen_string_literal: true

class OrderRetrievalJob
  include Sidekiq::Worker
  def perform
    OrderRetriever.call
  end
end
