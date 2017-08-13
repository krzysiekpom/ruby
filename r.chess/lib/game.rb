load 'messages.rb'
load 'board.rb'
load 'player.rb'
load 'piece.rb'
load 'move.rb'
require_relative 'helpers.rb'
require 'pry'
require 'pry-nav'

class Game
  include Helpers
  include Messages
  attr_accessor :board, :players, :pieces

  def initialize
    msg_welcome_message
    create_board
    @players = create_players
    @pieces  = create_pieces
    run_game
  end

  def run_game
    @players.cycle do |player|
        make_a_move(player)
    end
  end

  private

    def create_players
      players = []
      ["white", "black"].each do |color|
        msg_enter_player_name(color)
        name = gets.chomp
        players.push(self.instance_variable_set("@player_#{color}", Player.new(name, color)))
      end
      players
    end

    def create_board
      @board = Board.new
      @board_sq = board.squares
    end

    def create_pieces
      create_pawns
      create_non_pawns
    end

      def create_pawns
        [["white", 2], ["black", 7]].each do |color, y| 
          (1..8).each { |x| @board_sq[to_key([x, y])][:piece] = Pawn.new(color) } 
        end
      end
    
      def create_non_pawns
        [["white", 1], ["black", 8]].each do |color, y| 
          [1, 8].each { |x| @board_sq[to_key([x, y])][:piece] = Rook.new(color) } 
          [2, 7].each { |x| @board_sq[to_key([x, y])][:piece] = Knight.new(color) } 
          [3, 6].each { |x| @board_sq[to_key([x, y])][:piece] = Bishop.new(color) } 
          [4].each    { |x| @board_sq[to_key([x, y])][:piece] = Queen.new(color) } 
          [5].each    { |x| @board_sq[to_key([x, y])][:piece] = King.new(color) } 
        end
      end

    def make_a_move(player)
      Move.new(player, @board_sq)
    end
end


Game.new