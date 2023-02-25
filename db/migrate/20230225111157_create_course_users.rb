class CreateCourseUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :course_users do |t|
      t.references :user, null: false, foreign_key: true
      t.references :course, null: false, foreign_key: true
      t.float :payment_amount, null: false
      t.boolean :is_active, default: true

      t.timestamps
    end

    add_index :course_users, [:user_id, :course_id], unique: true
  end
end
