require "pry"

def good_practices
  game_hash.each do |location, team_data|
    #are you ABSOLUTELY SURE what 'location' and 'team data' are? use binding.pry to find out!
    binding.pry
      team_data.each do |attribute, data|
        #are you ABSOLUTELY SURE what 'attribute' and 'team data' are? use binding.pry to find out!
        binding.pry

        #what is 'data' at each loop through out .each block? when will the following line of code work and when will it break?
        data.each do |data_item|
            binding.pry
      end
    end
  end
end

######################################
######################################

def game_hash
  hashballhash = {
    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: {
                "Alan Anderson" => {
                  number: 0,
                  shoe: 16,
                  points: 22,
                  rebounds: 12,
                  assists: 12,
                  steals: 3,
                  blocks: 1,
                  slam_dunks: 1
                },
                "Reggie Evans" => {
                  number: 30,
                  shoe: 14,
                  points: 12,
                  rebounds: 12,
                  assists: 12,
                  steals: 12,
                  blocks: 12,
                  slam_dunks: 7
                },
                "Brook Lopez" => {
                  number: 11,
                  shoe: 17,
                  points: 17,
                  rebounds: 19,
                  assists: 10,
                  steals: 3,
                  blocks: 1,
                  slam_dunks: 15
                },
                "Mason Plumlee" => {
                  number: 1,
                  shoe: 19,
                  points: 26,
                  rebounds: 12,
                  assists: 6,
                  steals: 3,
                  blocks: 8,
                  slam_dunks: 5
                },
                "Jason Terry" => {
                  number: 31,
                  shoe: 15,
                  points: 19,
                  rebounds: 2,
                  assists: 2,
                  steals: 4,
                  blocks: 11,
                  slam_dunks: 1
                }
      }
    },
    away: {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players: {
                "Jeff Adrien" => {
                  number: 4,
                  shoe: 18,
                  points: 10,
                  rebounds: 1,
                  assists: 1,
                  steals: 2,
                  blocks: 7,
                  slam_dunks: 2
                },
                "Bismak Biyombo" => {
                  number: 0,
                  shoe: 16,
                  points: 12,
                  rebounds: 4,
                  assists: 7,
                  steals: 7,
                  blocks: 15,
                  slam_dunks: 10
                },
                "DeSagna Diop" => {
                  number: 2,
                  shoe: 14,
                  points: 24,
                  rebounds: 12,
                  assists: 12,
                  steals: 4,
                  blocks: 5,
                  slam_dunks: 5
                },
                "Ben Gordon" => {
                  number: 8,
                  shoe: 15,
                  points: 33,
                  rebounds: 3,
                  assists: 2,
                  steals: 1,
                  blocks: 1,
                  slam_dunks: 0
                },
                "Brendan Haywood" => {
                  number: 33,
                  shoe: 15,
                  points: 6,
                  rebounds: 12,
                  assists: 12,
                  steals: 22,
                  blocks: 5,
                  slam_dunks: 12
                }
        }
    }
  }
end

def num_points_scored (player_name)
  points = 0
  game_hash.each do |key, value|
    value.each do |newKey, newValue|
      if newKey == :players
        newValue.each do |newerKey, newValue|
          if newerKey == player_name
            points = newValue[:points]
          end
        end
      end
    end
  end
  points
end

def shoe_size (player_name)
  shoeSize = 0
  game_hash.each do |key, value|
    value.each do |newKey, newValue|
      if newKey == :players
        newValue.each do |newerKey, newValue|
          if newerKey == player_name
            shoeSize = newValue[:shoe]
          end
        end
      end
    end
  end
  shoeSize
end

def team_colors (teamName)
  teamColors = []
  game_hash.each do |key, value|
    if value[:team_name] == teamName
      teamColors = value[:colors]
    end
  end
  teamColors
end

def team_names
  teamNames = []
  game_hash.each do |key, value|
    teamNames << value[:team_name]
  end
  teamNames
end

def player_numbers (teamName)
  teamArray = []
  game_hash.each do |key, value|
    if value[:team_name] == teamName
      value[:players].each do |newKey, newValue|
        teamArray << newValue[:number]
      end
    end
  end
  teamArray
end

def player_stats (player_name)
  #playerStats = {}
  game_hash.each do |key, value|
    value[:players].each do |newKey, newValue|
      if newKey == player_name
        return newValue
      end
    end
  end
  #playerStats
end

def big_shoe_rebounds
  biggestShoe = 0
  biggestShoeRebound = 0
  game_hash.each do |key, value|
    value[:players].each do |newKey, newValue|
      if newValue[:shoe] > biggestShoe
        biggestShoe = newValue[:shoe]
        biggestShoeRebound = newValue[:rebounds]
      end
    end
  end
  biggestShoeRebound
end

def most_points_scored
  mvp = ""
  mvpPoints = 0
  game_hash.each do |key, value|
    value[:players].each do |newKey, newValue|
      if newValue[:points] > mvpPoints
        mvpPoints = newValue[:points]
        mvp = newKey
      end
    end
  end
  mvp
end

def winning_team
  winningTeam = ""
  winningTotal = 0
  game_hash.each do |key, value|
    if winningTotal == 0
      winningTeam = value[:team_name]
      value[:players].each do |newKey, newValue|
        winningTotal += newValue[:points]
      end
    else
      tallyTotal = 0
      value[:players].each do |newKey, newValue|
        tallyTotal += newValue[:points]
      end
      if tallyTotal > winningTotal
        winningTotal = tallyTotal
        winningTeam = value[:team_name]
      end
    end
  end
  winningTeam
end

def player_with_longest_name
  longName = ""
  longNameLetterCount = 0
  game_hash.each do |key, value|
    value[:players].each do |newKey, newValue|
      tempName = newKey
      if longNameLetterCount == 0
        longName = tempName
        longNameLetterCount = tempName.length
      elsif tempName.length > longNameLetterCount
        longName = tempName
        longNameLetterCount = tempName.length
      end
    end
  end
  longName
end

def long_name_steals_a_ton?
  longName = ""
  longNameLetterCount = 0
  thiefName = ""
  thiefStealCount = 0
  game_hash.each do |key, value|
    value[:players].each do |newKey, newValue|
      tempName = newKey
      if longNameLetterCount == 0
        longName = tempName
        longNameLetterCount = tempName.length
      elsif tempName.length > longNameLetterCount
        longName = tempName
        longNameLetterCount = tempName.length
      end
      if thiefStealCount == 0
        thiefName = tempName
        thiefStealCount = newValue[:steals]
      elsif newValue[:steals] > thiefStealCount
        thiefName = tempName
        thiefStealCount = newValue[:steals]
      end
    end
  end
  if longName == thiefName
    true
  else
    false
  end
end

def num_to_name (player_number)
  game_hash.each do |key, value|
    value[:player].each do |key, value|
      if value[:number] == player_number
        return key
      end
    end
  end
end
