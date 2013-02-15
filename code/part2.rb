class WrongNumberOfPlayersError < StandardError ; end
class NoSuchStrategyError < StandardError ; end

def rps_game_winner(game)
    raise WrongNumberOfPlayersError unless game.length == 2
    win_setups = {"p" => "s", "s" => "r", "r" => "p"}
    raise NoSuchStrategyError unless game.all?{|i| i[1].downcase =~ /p|r|s/}
    if game[1][1].downcase == win_setups[game[0][1].downcase]
        game[1]
    else
        game[0]
    end
end

def rps_tournament_winner(tournament)
    raise WrongNumberOfPlayersError unless tournament.length == 2
    if tournament[0][1].length > 1  
        rps_tournament_winner([rps_tournament_winner(tournament[0]), rps_tournament_winner(tournament[1])])
    else
        rps_game_winner([tournament[0], tournament[1]])
    end
end
