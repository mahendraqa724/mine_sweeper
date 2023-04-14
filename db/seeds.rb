# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

30.times do |i|
  width = rand(1..20)
  height = rand(1..20)
  total_mines = rand(1..width*height)
  MineSweeperBoard.create(name: "Mine Board #{i+1}", email: "test#{i}@gmail.com", board_width: width, board_height: height, total_mines: total_mines)
end
