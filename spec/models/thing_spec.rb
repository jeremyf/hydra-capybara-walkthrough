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
    verify_persistence(
      fedora_path: "#{subject.pid}/datastreams/properties/content",
      expected_template: "thing_properties.xml.erb",
      attributes: { title: title }
    )
  end


  protected
  def verify_persistence(options = {})
    path = options.fetch(:fedora_path)
    template_name = options.fetch(:expected_template)
    attributes = options.fetch(:attributes)

    actual = response_body_for(path)
    expected = rendered_template_for(template_name, attributes)
    expect(actual).to eq(expected)
  end

  def rendered_template_for(template_name, attributes)
    template = File.read(Rails.root.join('spec/fixtures/expected_fedora_templates', template_name))
    ERB.new(template).result(binding)
  end

  def response_body_for(path)
    uri = base_fedora_url
    uri.path = File.join("/fedora-test/objects", path)
    response = RestClient.get(uri.to_s)
    response.body
  end

  def base_fedora_url
    credentials = ActiveFedora.config.credentials
    uri = URI(credentials.fetch(:url))
    uri.user = credentials.fetch(:user)
    uri.password = credentials.fetch(:password)
    uri
  end

end
