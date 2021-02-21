class InstrumentSerializer
  include JSONAPI::Serializer
  # specify what attributes should be exposed in api
  attributes :slug, :name, :instrument_notes
  has_many :repairs
end
