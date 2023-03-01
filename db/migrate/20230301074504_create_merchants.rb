class CreateMerchants < ActiveRecord::Migration[7.0]
  def change
    create_table :merchants do |t|
      t.string :reference
      t.string :email
      t.datetime :live_on
      t.integer :disbursement_frequency
      t.integer :minimum_monthy_fee_in_cents

      t.timestamps
    end
  end
end
