class CreateLosts < ActiveRecord::Migration
  def change
    create_table :losts do |t|
      t.string :name
      t.string :animal
      t.string :gender
      t.string :size
      t.text :about
      t.string :city
      t.string :bairro
      t.string :date
      t.string :phone
      t.string :another_phone

      t.timestamps null: false
    end
  end
end
