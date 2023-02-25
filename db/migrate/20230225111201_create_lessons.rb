class CreateLessons < ActiveRecord::Migration[7.0]
  def change
    create_table :lessons do |t|
      t.references :course, null: false, foreign_key: true
      t.string :title, null: false
      t.text :content, null: false
      t.text :habit, null: false
      t.string :video, null: false
      t.datetime :available_from
      t.datetime :available_to

      t.timestamps
    end
  end
end
