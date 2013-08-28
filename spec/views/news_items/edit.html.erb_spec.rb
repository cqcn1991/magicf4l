require 'spec_helper'

describe "news_items/edit" do
  before(:each) do
    @news_item = assign(:news_item, stub_model(NewsItem,
      :title => "MyString",
      :address => "MyString",
      :description => "MyString",
      :user_id => 1
    ))
  end

  it "renders the edit news_item form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => news_items_path(@news_item), :method => "post" do
      assert_select "input#news_item_title", :name => "news_item[title]"
      assert_select "input#news_item_address", :name => "news_item[address]"
      assert_select "input#news_item_description", :name => "news_item[description]"
      assert_select "input#news_item_user_id", :name => "news_item[user_id]"
    end
  end
end
