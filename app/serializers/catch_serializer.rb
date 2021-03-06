class CatchSerializer < ActiveModel::Serializer
  attributes :id, :length, :weight, :tackle, :location, :fish, :trip, :fish_id
  has_one :fish, serializer: CatchFishSerializer
  has_one :trip, serializer: CatchTripSerializer
end
