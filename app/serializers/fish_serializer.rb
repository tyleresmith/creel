class FishSerializer < ActiveModel::Serializer
  attributes :id, :common_name, :species_name, :trips
end
