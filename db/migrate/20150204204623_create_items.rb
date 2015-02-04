class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.text :body, required: true
      t.boolean :completed, default: false

      t.timestamps null: false
    end
  end
end
