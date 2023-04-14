class CreateMineSweeperBoards < ActiveRecord::Migration[7.0]
  def change
    create_table :mine_sweeper_boards do |t|
      t.string :name
      t.string :email
      t.integer :board_width
      t.integer :board_height
      t.integer :total_mines

      t.timestamps
    end
  end
end
