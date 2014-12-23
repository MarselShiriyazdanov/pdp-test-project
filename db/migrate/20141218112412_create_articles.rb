class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title, null: false
      t.text :text, null: false
      t.references :user

      t.timestamps
    end
  end
end
