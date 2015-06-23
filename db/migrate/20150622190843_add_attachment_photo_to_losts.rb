class AddAttachmentPhotoToLosts < ActiveRecord::Migration
  def self.up
    change_table :losts do |t|
      t.attachment :photo
    end
  end

  def self.down
    remove_attachment :losts, :photo
  end
end
