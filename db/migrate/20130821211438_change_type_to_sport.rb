class ChangeTypeToSport < ActiveRecord::Migration
  def change
  	rename_column :games, :type, :sport
  end
end
