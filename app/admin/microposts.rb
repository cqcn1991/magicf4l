ActiveAdmin.register Micropost do
  index do
    column :title
    column :content
    column :created_at
    column :video_url
    column :important
    actions
  end

  form do |f|
    f.inputs "Details" do
      f.input :title
      f.input :video_url
      f.input :important
      #f.input :published_at, :label => "Publish Post At"
      f.input :content
    end
=begin
    f.inputs "Content" do

    end
=end
    f.actions
  end
end
