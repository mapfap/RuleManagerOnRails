class RemoveTimestampFromChangelog < ActiveRecord::Migration
  def change
  	remove_column :changelogs, :timestamp
  end
end
