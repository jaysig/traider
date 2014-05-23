class AddAttachmentImageToTrades < ActiveRecord::Migration
  def self.up
    change_table :trades do |t|
      t.attachment :image
    end
  end

  def self.down
    drop_attached_file :trades, :image
  end
end
