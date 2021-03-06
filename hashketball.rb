
def game_hash

  {
    home: {
      team_name: "Brooklyn Nets",
      colors: [ "Black", "White" ],
      players: {
        "Alan Anderson" => {
          number:     0,
          shoe:       16,
          points:     22,
          rebounds:   12,
          assists:    12,
          steals:     3,
          blocks:     1,
          slam_dunks: 1
        },
        "Reggie Evans" => {
          number:     30,
          shoe:       14,
          points:     12,
          rebounds:   12,
          assists:    12,
          steals:     12,
          blocks:     12,
          slam_dunks: 7
        },
        "Brook Lopez" => {
          number:     11,
          shoe:       17,
          points:     17,
          rebounds:   19,
          assists:    10,
          steals:     3,
          blocks:     1,
          slam_dunks: 15
        },
        "Mason Plumlee" => {
          number:     1,
          shoe:       19,
          points:     26,
          rebounds:   12,
          assists:    6,
          steals:     3,
          blocks:     8,
          slam_dunks: 5
        },
        "Jason Terry" => {
          number:     31,
          shoe:       15,
          points:     19,
          rebounds:   2,
          assists:    2,
          steals:     4,
          blocks:     11,
          slam_dunks: 1
        }
      }
    },
    away: {
      team_name: "Charlotte Hornets",
      colors: [ "Turquoise", "Purple" ],
      players: {
        "Jeff Adrien" => {
          number:     4,
          shoe:       18,
          points:     10,
          rebounds:   1,
          assists:    1,
          steals:     2,
          blocks:     7,
          slam_dunks: 2
        },
        "Bismak Biyombo" => {
          number:     0,
          shoe:       16,
          points:     12,
          rebounds:   4,
          assists:    7,
          steals:     7,
          blocks:     15,
          slam_dunks: 10
        },
        "DeSagna Diop" => {
          number:     2,
          shoe:       14,
          points:     24,
          rebounds:   12,
          assists:    12,
          steals:     4,
          blocks:     5,
          slam_dunks: 5
        },
        "Ben Gordon" => {
          number:     8,
          shoe:       15,
          points:     33,
          rebounds:   3,
          assists:    2,
          steals:     1,
          blocks:     1,
          slam_dunks: 0
        },
        "Brendan Haywood" => {
          number:     33,
          shoe:       15,
          points:     6,
          rebounds:   12,
          assists:    12,
          steals:     22,
          blocks:     5,
          slam_dunks: 12
        }
      }
    }
  }

end


def all_players
  game_hash[:home][:players].merge(game_hash[:away][:players])
end


def all_teams
  game_hash.values
end


def num_points_scored(playername)
  # search over players
  all_players[playername][:points]
end


def shoe_size(playername)
  # search ove players
  all_players[playername][:shoe]
end


def team_find(teamname)
  all_teams.find { |team| team[:team_name] == teamname }
end


def team_colors(teamname)
  team_find(teamname)[:colors]
end


def team_names
  all_teams.collect { |team| team[:team_name] }
end


def player_numbers(teamname)
  team_find(teamname)[:players].collect { |player,data| data[:number] }
end


def player_stats(playername)
  all_players[playername]
end


def big_shoe_rebounds
  # search over players
  #best = nil
  #all_players.each do |player,data|
  #  if best == nil || data[:shoe] > best[:shoe]
  #    best = data
  #  end
  #end
  best = all_players.max_by { |player,data| data[:shoe] }
  #binding.pry
  best[1][:rebounds]
end


def most_points_scored
  best = all_players.max_by { |player,data| data[:points] }
  best[0]
end


def team_points(team)

  sum = 0
  team[:players].each do | name,data |
    sum += data[:points]
  end

  sum
end


def winning_team
  winner = all_teams.max_by { | team | team_points(team) }
  winner[:team_name]
end


def player_with_longest_name
  all_players.max_by { | player, data |  player.length } [0]
end


def player_with_most_steals
  all_players.max_by { | player, data |  data[:steals] } [0]
end


def long_name_steals_a_ton?
  player_with_longest_name == player_with_most_steals
end


################################################################################

require 'pry'

def test

  x = player_with_most_steals
  binding.pry

end

#test
#big_shoe_rebounds
