require 'spec_helper'

describe "microposts/show" do
  before(:each) do
    @micropost = assign(:micropost, stub_model(Micropost,
      :content => "MyText",
      :url => "Url",
      :user_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
    rendered.should match(/Url/)
    rendered.should match(/1/)
  end
end
