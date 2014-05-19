class AddModeToChangelog < ActiveRecord::Migration
  def change
  	add_column :changelogs, :mode, :string
  end
end
