class CreateChangelogs < ActiveRecord::Migration
  def change
    create_table :changelogs do |t|
      t.integer :rule
      t.text :user
      t.text :new_if
      t.text :new_then
      t.text :new_tag
      t.datetime :timestamp
      t.text :ip

      t.timestamps
    end
  end
end
