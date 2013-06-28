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

end