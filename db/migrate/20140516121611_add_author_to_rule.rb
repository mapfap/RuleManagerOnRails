class AddAuthorToRule < ActiveRecord::Migration
  def change
  	 add_column :users, :author, :string
  end
end
