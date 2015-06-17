class CreateDocumentets < ActiveRecord::Migration
  def change
    create_table :documentets do |t|
      t.integer :user_id
      t.timestamps null: false
    end

    add_index :documentets, :user_id
    add_attachment :documentets, :attachmentet
    add_column :posts, :documentet_id, :integer
  end
end
