class AddBetToPlayers < ActiveRecord::Migration
  def change
  	add_column :players, :bet, :integer
  end
end
