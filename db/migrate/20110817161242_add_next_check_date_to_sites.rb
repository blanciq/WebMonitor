class AddNextCheckDateToSites < ActiveRecord::Migration
  def self.up
    add_column :sites, :next_check_date, :date
  end

  def self.down
    remove_column :sites, :next_check_date
  end
end
