class CreatePayments < ActiveRecord::Migration[7.0]
  def change
    create_table :payments do |t|
      t.references :user, null: false, foreign_key: true
      t.references :course, null: false, foreign_key: true
      t.decimal :amount, precision: 10, scale: 2, null: false

      t.timestamps
    end
  end
end
