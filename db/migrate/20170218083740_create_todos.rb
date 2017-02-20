class CreateTodos < ActiveRecord::Migration
  def change
    create_table :todos do |t|
      t.references :user, index: true, null: false, foreign_key: true
      t.string :content,   null: false # NOT NULL制約を追加
      t.integer :age
      t.string :cost
      t.boolean :completed, null: false, default: false # NOT NULL制約とデフォルト値を追加
      t.datetime :completion_date
      t.timestamps null: false
      t.index [:user_id, :created_at]
    end
  end
end
