class AddAttachmentImageFileToPhotos < ActiveRecord::Migration
  def self.up
    change_table :photos do |t|
      t.attachment :image_file
    end
  end

  def self.down
    drop_attached_file :photos, :image_file
  end
end
