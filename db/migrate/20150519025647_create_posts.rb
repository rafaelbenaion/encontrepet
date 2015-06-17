class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :name
      t.string :age
      t.string :animal
      t.string :gender
      t.string :size
      t.text :about


      t.timestamps null: false
    
    

    end
  end
end
