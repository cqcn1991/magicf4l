require 'spec_helper'

describe "news_items/show" do
  before(:each) do
    @news_item = assign(:news_item, stub_model(NewsItem,
      :title => "Title",
      :address => "Address",
      :description => "Description",
      :user_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Title/)
    rendered.should match(/Address/)
    rendered.should match(/Description/)
    rendered.should match(/1/)
  end
end
