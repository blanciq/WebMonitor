class CreateSiteChecks < ActiveRecord::Migration
  def self.up
    create_table :site_checks do |t|
      t.integer :site_id
      t.integer :tool_id
      t.string :result
      t.timestamps
    end
  end

  def self.down
    drop_table :site_checks
  end
end
