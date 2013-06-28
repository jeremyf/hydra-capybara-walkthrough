require 'spec_helper'

describe "things/show" do
  before(:each) do
    @thing = assign(:thing, stub_model(Thing,
      :title => "Title"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Title/)
  end
end
