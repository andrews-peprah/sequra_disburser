# frozen_string_literal: true

class Order < ApplicationRecord
  validates :merchant, presence: true
  belongs_to :merchant, required: true
end
