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
    verify_fedora_persistence(Thing, pid, title: title)
  end

  it 'is not changed when I view it' do
    thing = Thing.create!(title: title)
    expect {
      visit thing_path(thing)
    }.to_not(
      change {
        fedora_persistence_for("#{thing.pid}/datastreams/properties/content")
      }
    )
  end

  it 'is changed when I update it' do
    thing = Thing.create!(title: title)
    new_title = title + ' New'
    expect {
      visit edit_thing_path(thing)
      within('.edit_thing') {
        fill_in('Title', with: new_title)
        click_button('Update Thing')
      }
    }.to(
      change {
        fedora_persistence_for("#{thing.pid}/datastreams/properties/content")
      }.
      from(rendered_template_for("thing/datastreams/properties.xml.erb", title: title)).
      to(rendered_template_for("thing/datastreams/properties.xml.erb", title: new_title))
    )
  end

  def extract_pid_from_path(path)
    page.current_path.split("/").grep(/^changeme:/).first
  end
end
