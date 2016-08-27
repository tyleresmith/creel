class TripCatchSerializer < ActiveModel::Serializer
  attributes :id, :location, :weight, :length, :fish, :tackle
  has_one :fish, serializer: CatchFishSerializer
end
