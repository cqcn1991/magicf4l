class CreateSites < ActiveRecord::Migration
  def change
    create_table :sites do |t|
      t.string :title
      t.text :description
      t.integer :category_id
      t.string :site_url

      t.timestamps
    end
  end
end
