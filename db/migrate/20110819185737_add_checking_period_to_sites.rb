class AddCheckingPeriodToSites < ActiveRecord::Migration
  def self.up
    add_column :sites, :checking_period, :integer, :default => 1
  end

  def self.down
    remove_column :sites, :checking_period
  end
end
