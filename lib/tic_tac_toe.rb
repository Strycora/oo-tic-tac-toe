class TicTacToe
    WIN_COMBINATIONS = [
        [0,1,2],
        [3,4,5],
        [6,7,8],
        [0,3,6],
        [1,4,7],
        [2,5,8],
        [0,4,8],
        [6,4,2]
    ]
    
    def initialize
        @board = Array.new(9, " ") #array of 9 blank spaces
    end

    def display_board
        puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
        puts "-----------"
        puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
        puts "-----------"
        puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end

    def input_to_index(input)
        index = input.to_i - 1 #converts input to integer and subtracts 1 for index
    end

    def move(index, token)
        @board[index] = token #puts token X or O at a given space on board
    end

    def position_taken?(index)
        @board[index] != " " #if the space is not an empty space
    end

    def valid_move?(index)
        !position_taken?(index) && index.between?(0, 8) #if position is not taken and index falls on the board
    end

    def turn_count
        @board.count {|space| space != " "} #counts the number of spaces that are not " "
    end

    def current_player
        turn_count.even? ? "X" : "O" #even turns are x, odd turns are o
    end

    def turn
        puts "Please enter 1-9"
        input = gets.strip #gets input from the player
        index = input_to_index(input)
        if valid_move?(index)
            move(index, current_player) 
            display_board
            # checks if the move is valid, makes the move, displays board
        else
            puts 'Invalid Choice, please try again'
            turn
        end
     end

        def won?
            WIN_COMBINATIONS.find do |win_combo| #looks for the first time that X or O occupies all win_combo spaces
                index_1 = win_combo[0]
                index_2 = win_combo[1]
                index_3 = win_combo[2]

                token_1 = @board[index_1]
                token_2 = @board[index_2]
                token_3 = @board[index_3]

                token_1 == token_2 && token_2 == token_3 && token_1 != " "
            end
        end

        def full?
            @board.none? {|position| position == " "} #if no positions are empty
        end

        def draw?
            !won? && full?
        end

        def over?
            won? || draw?
        end

        def winner
            if win_combo = won? #if a win combo is occupied entirely by X or O
                @board[win_combo[0]] #return the winning token
            end
        end

        def play 
            puts "Welcome to Tic Tac Toe!"
            display_board
            until over? #plays turns until game is won or draw
                turn
            end
            if won?
                puts "Congratulations #{winner}!" #interpolates winning token
            else
                puts "Cat's Game!" #return if game is a draw
            end
        end





end
