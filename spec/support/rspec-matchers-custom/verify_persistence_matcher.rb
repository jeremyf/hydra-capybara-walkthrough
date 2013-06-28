module ActiveFedora
  # Methods that are helpful for negotiating calls to Fedora
  #
  # @TODO - checking only the properties datastream is inadequate, incorporate
  #   more data streams.
  # @TODO - the datastreams/URLs to check should be defined on a per Resource
  #   level; That is to say Thing should say "check [datastreams/properties]"
  #   The location of templates should be based on conventions mapping to the
  #   URL.
  # @TODO - by creating multiple files to check, we will need to alter how the
  #   matches occur.
  module PersistenceSpecHelper
    def render_templates_with(attributes)
      template_name = "#{String(@klass).underscore}/datastreams/properties.xml.erb"
      template = File.read(Rails.root.join('spec/fixtures/expected_fedora_templates', template_name))
      ERB.new(template).result(binding)
    end

    def fedora_persistence
      path = "datastreams/properties/content"
      uri = base_fedora_url
      uri.path = File.join("/fedora-test/objects", String(@pid), path)
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

    def extract_class_and_pid_from(*context)
      options = context.extract_options!
      if options.present?
        @pid = options[:pid]
        @klass = options[:class]
      else
        @pid = context.first.pid
        @klass = context.first.class
      end
    end
  end
end

RSpec::Matchers.define :have_valid_persistence do |attributes|
  extend ActiveFedora::PersistenceSpecHelper
  @attributes = attributes

  match do |context|
    extract_class_and_pid_from(context)
    actual = fedora_persistence
    expected = render_templates_with(@attributes)
    actual == expected
  end
end

RSpec::Matchers.define :change_persistence do |context|
  extend ActiveFedora::PersistenceSpecHelper
  extract_class_and_pid_from(context)
  chain(:from) {|from| @from = from }
  chain(:to) {|to| @to = to}

  match do |event|
    validate_from_and_to!
    @actual_before = evaluate(:from)
    event.call
    @actual_after = evaluate(:to)
    has_changed?
  end

  def has_changed?
    @actual_before != @actual_after
  end

  def validate_from_and_to!
    if (defined?(@from) && ! defined?(@to))
      raise(
        RSpec::Expectations::ExpectationNotMetError,
        ":from option was declared but not :to"
      )
    elsif (defined?(@to) && ! defined?(@from))
      raise(
        RSpec::Expectations::ExpectationNotMetError,
        ":to option was declared but not :from"
      )
    end
  end

  def evaluate(mode)
    persistence = fedora_persistence
    if attributes = instance_variable_get("@#{mode}")
      if render_templates_with(attributes) != persistence
        raise(
          RSpec::Expectations::ExpectationNotMetError,
          "Expected Persistence and Actual Persistence for #{mode.inspect} are not the same."
        )
      end
    end
    persistence
  end
end
