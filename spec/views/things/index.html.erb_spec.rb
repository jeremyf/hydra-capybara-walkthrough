require 'spec_helper'

describe "things/index" do
  before(:each) do
    assign(:things, [
      stub_model(Thing,
        :title => "Title"
      ),
      stub_model(Thing,
        :title => "Title"
      )
    ])
  end

  it "renders a list of things" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Title".to_s, :count => 2
  end
end
