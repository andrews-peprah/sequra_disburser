require 'rails_helper'

RSpec.describe Order, type: :model do
  it 'associates order to merchant' do
    expect do
      create(:order)
    end.to change { Order.count }.by(1)
  end

  it 'fails to create order without merchant' do
    expect do
      create(:order, merchant: nil)
    end.to change { Order.count }.by(0)
                                 .and raise_error(ActiveRecord::RecordInvalid)
  end
end
