require 'spec_helper'

describe 'Thing Persistence' do
  let(:title) { 'My Title' }
  it 'is stored as expected when I create it' do
    visit new_thing_path
    within('#new_thing') do
      fill_in('Title', with: title)
      click_button('Create Thing')
    end

    pid = extract_pid_from_path(page.current_path)
    verify_persistence(
      fedora_path: "#{pid}/datastreams/properties/content",
      expected_template: "thing_properties.xml.erb",
      attributes: { title: title }
    )
  end

  it 'is not changed when I view it' do
    thing = Thing.create!(title: title)
    expect {
      visit thing_path(thing)
    }.to_not change {
      fedora_persistence_for("#{thing.pid}/datastreams/properties/content")
    }
  end

  def extract_pid_from_path(path)
    page.current_path.split("/").grep(/^changeme:/).first
  end
end
