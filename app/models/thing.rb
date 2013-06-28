# Generated via
#  `rails generate active_fedora::model Thing`
require 'active_fedora/base'
class Thing < ActiveFedora::Base

  # The SimpleDatastream is stored in a very simple manner. For metadata that
  # should be well formed and utilizing a schema, you will want to look to
  # creating your own MetadataDatastream class.
  has_metadata name: 'properties', type: ActiveFedora::SimpleDatastream do |ds|
    ds.field :title, :string
  end
  delegate_to :properties, [:title], unique: true

  # Uncomment the following lines to add a #descMetadata method that is a
  #   datastream. You will need to specify the :type:, which may involve
  #   creating a new Datastream object.
  #
  # has_metadata name: "descMetadata", type: ThingMetadataDatastream

  # Uncomment the following lines to add an #attachment method that is a
  #   file_datastream:
  #
  # has_file_datastream "attachment"

  # "If you need to add additional attributes to the SOLR document, define the
  # #to_solr method and make sure to use super"
  #
  # def to_solr(solr_document={}, options={})
  #   super(solr_document, options)
  #   solr_document["my_attribute_s"] = my_attribute
  #   return solr_document
  # end

end
