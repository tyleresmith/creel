class TripSerializer < ActiveModel::Serializer
  attributes :id, :location,:date, :state, :water_type, :body_type, :user_id, :city
  has_many :fishes
end
