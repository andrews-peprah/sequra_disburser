require 'rails_helper'

RSpec.describe Merchant, type: :model do
  it 'creates a merchant' do
    expect do
      create(:merchant)
    end.to change { Merchant.count }.by(1)
  end

  it 'prevents duplicate merchant references' do
    merchant = create(:merchant)
    expect do
      create(:merchant, reference: merchant.reference)
    end.to change { Merchant.count }.by(0)
                                    .and raise_error(ActiveRecord::RecordInvalid)
  end
end
