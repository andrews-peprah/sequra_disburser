class CreateDisbursements < ActiveRecord::Migration[7.0]
  def change
    create_table :disbursements do |t|
      t.references :merchant, null: false, foreign_key: true
      t.references :order, null: false, foreign_key: true
      t.integer :fee_in_cents

      t.timestamps
    end
  end
end
