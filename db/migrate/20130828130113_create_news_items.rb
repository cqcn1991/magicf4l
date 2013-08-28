class CreateNewsItems < ActiveRecord::Migration
  def change
    create_table :news_items do |t|
      t.string :title
      t.string :address
      t.string :description
      t.integer :user_id

      t.timestamps
    end
  end
end
