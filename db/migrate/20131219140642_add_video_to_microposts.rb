class AddVideoToMicroposts < ActiveRecord::Migration
  def change
    add_column :microposts, :video, :boolean, default: false
    add_column :microposts, :source, :string

    Micropost.all.each do |micropost|
      if micropost.is_video?
        micropost.video = true
        micropost.save
      end
    end
  end
end
