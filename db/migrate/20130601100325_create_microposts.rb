class CreateMicroposts < ActiveRecord::Migration
  def change
    create_table :microposts do |t|
      t.text :content
      t.string :title
      t.string :video_url
      t.string :video_thumbnail_url
      t.string :article_url
      t.integer :user_id

      t.timestamps
    end
  end
end