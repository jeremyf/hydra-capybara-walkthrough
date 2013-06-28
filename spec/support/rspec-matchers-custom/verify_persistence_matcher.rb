module Rspec
  module Matchers
    module Custom
      module VerifyPersistenceMatcher
        class Matcher < DelegateClass(RSpec::Core::ExampleGroup)
          attr_accessor :klass, :pid
          private :klass, :pid
          def initialize(context, klass, pid)
            super(context)
            self.klass = klass
            self.pid = pid
          end

          def verify_persistence!(attributes)
            actual = fedora_persistence
            expected = render_templates_with(attributes)
            expect(actual).to eq(expected)
          end

          def fedora_persistence
            path = "datastreams/properties/content"
            uri = base_fedora_url
            uri.path = File.join("/fedora-test/objects", String(pid), path)
            response = RestClient.get(uri.to_s)
            response.body
          end

          def render_templates_with(attributes)
            template_name = "#{String(klass).underscore}/datastreams/properties.xml.erb"
            template = File.read(Rails.root.join('spec/fixtures/expected_fedora_templates', template_name))
            ERB.new(template).result(binding)
          end

          private
            def base_fedora_url
              credentials = ActiveFedora.config.credentials
              uri = URI(credentials.fetch(:url))
              uri.user = credentials.fetch(:user)
              uri.password = credentials.fetch(:password)
              uri
            end

        end

        def verify_persistence_matcher(klass, pid)
          @verify_persistence_matcher ||= Matcher.new(self,klass,pid)
        end
        private :verify_persistence_matcher

        def verify_fedora_persistence(klass, pid, attributes = {})
          verify_persistence_matcher(klass, pid).verify_persistence!(attributes)
        end

        def fedora_persistence_for(klass, pid)
          verify_persistence_matcher(klass, pid).fedora_persistence
        end

        def rendered_template_for(klass, pid, attributes)
          verify_persistence_matcher(klass, pid).render_templates_with(attributes)
        end
      end
    end
  end
end
