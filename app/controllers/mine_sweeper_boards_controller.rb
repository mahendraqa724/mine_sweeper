class MineSweeperBoardsController < ApplicationController
  before_action :set_mine_sweeper_board, only: %i[ show edit update destroy ]

  # GET /mine_sweeper_boards or /mine_sweeper_boards.json
  def index
    @mine_sweeper_boards = MineSweeperBoard.all.order(created_at: :desc).paginate(page: params[:page], per_page: 10)
    @mine_sweeper_boards = MineSweeperBoard.paginate(page: params[:page], per_page: 10)
  end
  
  def recent_boards
    @mine_sweeper_boards = MineSweeperBoard.all.order(created_at: :desc).limit(10)
  end

  # GET /mine_sweeper_boards/1 or /mine_sweeper_boards/1.json
  def show
    total_cell = @mine_sweeper_board.board_width * @mine_sweeper_board.board_height
    a = (0..total_cell-1).to_a.shuffle
    @filled_columns = Array.new(@mine_sweeper_board.total_mines.abs) { a.pop }
  end

  # GET /mine_sweeper_boards/new
  def new
    @mine_sweeper_board = MineSweeperBoard.new
  end

  # GET /mine_sweeper_boards/1/edit
  def edit
  end

  # POST /mine_sweeper_boards or /mine_sweeper_boards.json
  def create
    @mine_sweeper_board = MineSweeperBoard.new(mine_sweeper_board_params)

    respond_to do |format|
      if @mine_sweeper_board.save
        format.html { redirect_to mine_sweeper_board_url(@mine_sweeper_board), notice: "Mine sweeper board was successfully created." }
        format.json { render :show, status: :created, location: @mine_sweeper_board }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @mine_sweeper_board.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /mine_sweeper_boards/1 or /mine_sweeper_boards/1.json
  def update
    respond_to do |format|
      if @mine_sweeper_board.update(mine_sweeper_board_params)
        format.html { redirect_to mine_sweeper_board_url(@mine_sweeper_board), notice: "Mine sweeper board was successfully updated." }
        format.json { render :show, status: :ok, location: @mine_sweeper_board }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @mine_sweeper_board.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mine_sweeper_boards/1 or /mine_sweeper_boards/1.json
  def destroy
    @mine_sweeper_board.destroy

    respond_to do |format|
      format.html { redirect_to mine_sweeper_boards_url, notice: "Mine sweeper board was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mine_sweeper_board
      @mine_sweeper_board = MineSweeperBoard.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def mine_sweeper_board_params
      params.require(:mine_sweeper_board).permit(:name, :email, :board_width, :board_height, :total_mines)
    end
end
