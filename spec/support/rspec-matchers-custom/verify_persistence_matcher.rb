module Rspec
  module Matchers
    module Custom
      module VerifyPersistenceMatcher
        def verify_fedora_persistence(klass, pid, attributes = {})
          actual = fedora_persistence_for(pid)
          expected = rendered_template_for(klass, attributes)
          expect(actual).to eq(expected)
        end

        def rendered_template_for(klass, attributes)
          template_name = "#{String(klass).underscore}/datastreams/properties.xml.erb"
          template = File.read(Rails.root.join('spec/fixtures/expected_fedora_templates', template_name))
          ERB.new(template).result(binding)
        end

        def fedora_persistence_for(pid)
          path = "datastreams/properties/content"
          uri = base_fedora_url
          uri.path = File.join("/fedora-test/objects", String(pid), path)
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
