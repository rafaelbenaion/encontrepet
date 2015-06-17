class AddToPosts < ActiveRecord::Migration
  def change
  	  add_column :posts, :castrado, :string
      add_column :posts, :vacinado, :string
      add_column :posts, :telefone, :string
      add_column :posts, :celular, :string
      add_column :posts, :cidade, :string
  end
end
