# frozen_string_literal: true

class HelloWorld
  include Sidekiq::Worker
  def perform
    puts 'Hello world!'
  end
end