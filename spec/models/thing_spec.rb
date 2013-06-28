# Generated via
#  `rails generate active_fedora::model Thing`
require 'spec_helper'
require 'active_fedora/test_support'

describe Thing do
  include ActiveFedora::TestSupport
  subject { Thing.new }

  it 'should persist to Fedora' do
    subject.save!
    expect {
      subject.reload
    }.to_not raise_error(ActiveFedora::ObjectNotFoundError)

    subject.destroy
  end

  let(:title) { "A Specific Title" }
  it 'should have a title' do
    subject.title = title
    subject.save!
    subject.reload
    expect(subject.title).to eq(title)
    subject.destroy
  end

end