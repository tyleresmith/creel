class AddAttachmentAvatarToFish < ActiveRecord::Migration
  def self.up
    change_table :fish do |t|
      t.attachment :avatar
    end
  end

  def self.down
    remove_attachment :fish, :avatar
  end
end
