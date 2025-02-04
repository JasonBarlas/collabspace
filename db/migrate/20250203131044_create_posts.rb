class CreatePosts < ActiveRecord::Migration[8.0]
  def change
    create_table :posts do |t|
      t.string :title, null: false, default: ""
      t.text :content, null: false, default: ""
      t.belongs_to :category, index: true, null: true
      t.belongs_to :user,     index: true, null: false
      t.timestamps
    end
  end
end
