class CreateProfiles < ActiveRecord::Migration[7.0]
  def change
    create_table :profiles do |t|
      t.references :user, null: false, foreign_key: true
      t.string :before_photo
      t.string :after_photo
      t.string :avatar

      t.timestamps
    end
  end
end
