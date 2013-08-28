require 'spec_helper'

describe "news_items/new" do
  before(:each) do
    assign(:news_item, stub_model(NewsItem,
      :title => "MyString",
      :address => "MyString",
      :description => "MyString",
      :user_id => 1
    ).as_new_record)
  end

  it "renders new news_item form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => news_items_path, :method => "post" do
      assert_select "input#news_item_title", :name => "news_item[title]"
      assert_select "input#news_item_address", :name => "news_item[address]"
      assert_select "input#news_item_description", :name => "news_item[description]"
      assert_select "input#news_item_user_id", :name => "news_item[user_id]"
    end
  end
end
