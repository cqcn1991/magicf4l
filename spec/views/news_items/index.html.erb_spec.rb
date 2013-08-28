require 'spec_helper'

describe "news_items/index" do
  before(:each) do
    assign(:news_items, [
      stub_model(NewsItem,
        :title => "Title",
        :address => "Address",
        :description => "Description",
        :user_id => 1
      ),
      stub_model(NewsItem,
        :title => "Title",
        :address => "Address",
        :description => "Description",
        :user_id => 1
      )
    ])
  end

  it "renders a list of news_items" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "Address".to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
