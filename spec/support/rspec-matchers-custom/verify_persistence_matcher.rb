module Rspec
  module Matchers
    module Custom
      module VerifyPersistenceMatcher

        def verify_fedora_persistence(klass, pid, attributes = {})
          verify_persistence(
            fedora_path: "#{pid}/datastreams/properties/content",
            expected_template: "#{String(klass).underscore}/datastreams/properties.xml.erb",
            attributes: attributes
          )
        end

        def verify_persistence(options = {})
          path = options.fetch(:fedora_path)
          template_name = options.fetch(:expected_template)
          attributes = options.fetch(:attributes)

          actual = fedora_persistence_for(path)
          expected = rendered_template_for(template_name, attributes)
          expect(actual).to eq(expected)
        end
        protected :verify_persistence

        def rendered_template_for(template_name, attributes)
          template = File.read(Rails.root.join('spec/fixtures/expected_fedora_templates', template_name))
          ERB.new(template).result(binding)
        end

        def fedora_persistence_for(path)
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
    end
  end
end
