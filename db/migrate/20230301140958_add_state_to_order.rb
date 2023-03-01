class AddStateToOrder < ActiveRecord::Migration[7.0]
  def change
    add_column :orders, :aasm_state, :string, default: 'pending'
  end
end
