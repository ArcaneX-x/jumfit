class CreateCourses < ActiveRecord::Migration[7.0]
  def change
    create_table :courses do |t|
      t.string :title, null: false
      t.text :description
      t.float :price, null: false

      t.timestamps
    end
  end
end
