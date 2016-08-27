class CatchTripSerializer < ActiveModel::Serializer
  attributes :id, :location, :city, :state, :water_type, :body_type
end
