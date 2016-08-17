class Fish < ActiveRecord::Base
    has_many :catches
    has_many :trips, through: :catches
    has_many :users, through: :trips
    has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/fish_avatar.png"
    validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
end
