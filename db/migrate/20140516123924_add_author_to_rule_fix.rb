class AddAuthorToRuleFix < ActiveRecord::Migration
  def change
  	add_column :rules, :author, :string
  end
end
