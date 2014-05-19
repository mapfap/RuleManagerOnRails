class CreateRules < ActiveRecord::Migration
  def change
    create_table :rules do |t|
      t.text :if
      t.text :then
      t.text :tag

      t.timestamps
    end
  end
end
