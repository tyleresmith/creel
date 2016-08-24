class TripSerializer < ActiveModel::Serializer
  attributes :id, :location,:date, :state, :water_type, :body_type, :user_id
  has_many :fish
end
