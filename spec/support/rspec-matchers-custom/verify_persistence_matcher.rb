module Rspec
  module Matchers
    module Custom
      module VerifyPersistenceMatcher
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
    end
  end
end
