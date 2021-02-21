class RepairSerializer
  include JSONAPI::Serializer
  # specify what attributes should be exposed in api
  attributes :repair_description, :date, :instrument_id
end
