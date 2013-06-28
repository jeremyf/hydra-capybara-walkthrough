# Generated via
#  `rails generate active_fedora::model Thing`
require 'spec_helper'
require 'active_fedora/test_support'

describe Thing do
  include ActiveFedora::TestSupport
  subject { Thing.new }

  after(:each) do
    subject.destroy if subject.persisted?
  end

  it 'should persist to Fedora' do
    subject.save!
    expect {
      subject.reload
    }.to_not raise_error(ActiveFedora::ObjectNotFoundError)
  end

  let(:title) { "A Specific Title" }
  it 'should have a title' do
    subject.title = title
    subject.save!
    subject.reload
    verify_fedora_persistence(subject.class, subject.pid, title: title)
  end

end
