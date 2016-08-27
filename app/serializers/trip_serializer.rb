class TripSerializer < ActiveModel::Serializer
  attributes :id, :location,:date, :state, :water_type, :body_type, :user_id, :city, :catches
  has_many :catches, serializer: TripCatchSerializer
end
