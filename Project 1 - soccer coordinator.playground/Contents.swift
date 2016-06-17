//: Playground - noun: a place where people can play

import UIKit
import Foundation

//All players, each with own dictionaries in an array
var allPlayers:Array<Dictionary<String, String>> = [
    [
    "Name": "Joe Smith",
    "Height": "42",
    "Experienced": "true",
    "Guardian": "Jim and Jan Smith"
    ],

    [
    "Name": "Jill Tanner",
    "Height": "36",
    "Experienced": "true",
    "Guardian": "Clara Tanner"
    ],

    [
    "Name": "Bill Bon",
    "Height": "43",
    "Experienced": "true",
    "Guardian": "Sara and Jenny Bon"
    ],

    [
    "Name": "Eva Gordon",
    "Height": "45",
    "Experienced": "false",
    "Guardian": "Wendy and Mike Gordon"
    ],

    [
    "Name": "Matt Gill",
    "Height": "40",
    "Experienced": "false",
    "Guardian": "Charles and Sylvia Gill"
    ],

    [
    "Name": "Kimmy Stein",
    "Height": "41",
    "Experienced": "false",
    "Guardian": "Bill and Hillary Stein"
    ],

    [
    "Name":"Sammy Adams",
    "Height": "45",
    "Experienced": "false",
    "Guardian": "Jeff Adams"
    ],

    [
    "Name":"Karl Saygan",
    "Height": "42",
    "Experienced": "true",
    "Guardian": "Heather Bledsoe"
    ],

    [
    "Name": "Suzane Greenberg",
    "Height": "44",
    "Experienced": "true",
    "Guardian": "Henrietta Dumas"
    ],

    [
    "Name": "Sal Dali",
    "Height": "41",
    "Experienced": "false",
    "Guardian": "Gala Dali"
    ],

    [
    "Name": "Joe Kavalier",
    "Height":"39",
    "Experienced": "false",
    "Guardian": "Sam and Elaine Kavalier"
    ],

    [
    "Name": "Ben Finkelstein",
    "Height": "44",
    "Experienced": "false",
    "Guardian": "Aaron and Jill Finkelstein"
    ],

    [
    "Name": "Diego Soto",
    "Height": "41",
    "Experienced": "true",
    "Guardian": "Robin and Sarika Soto"
    ],

    [
    "Name": "Chloe Alaska",
    "Height": "47",
    "Experienced": "false",
    "Guardian": "David and Jamie Alaska"
    ],

    [
    "Name": "Arnold Willis",
    "Height": "43",
    "Experienced": "false",
    "Guardian": "Claire Willis"
    ],
    
    [
    "Name": "Phillip Helm",
    "Height": "44",
    "Experienced": "true",
    "Guardian": "Thomas Helm and Eva Jones"
    ],
    
    [
    "Name": "Les Clay",
    "Height": "42",
    "Experienced": "true",
    "Guardian": "Wynonna Brown"
    ],
    
    [
    "Name": "Herschel Krustofski",
    "Height": "45",
    "Experienced": "true",
    "Guardian": "Hyman and Rachel Krustofski"
    ]
]

//Testing recalling data
var name = allPlayers[1]["Name"]


//Setting empty arrays for experienced and inexperienced players
var experiencedPlayers:Array<Dictionary<String, String>> = []

var inexperiencedPlayers:Array<Dictionary<String, String>> = []

/* For each person in the all player array, if that person is experienced add them to the experienced array, if they are not experienced add them to the inexperienced array */

for var person in allPlayers {
//    for (keys, values) in person {

       if (person["Experienced"] == "true")  {
           experiencedPlayers.append(person)
          
       } else {
            inexperiencedPlayers.append(person)
        }
    }

//recalling the arrays to see if they were filled up
experiencedPlayers
inexperiencedPlayers



//creating an array to hold the empty teams (there may be a better way to do this)
var teams:Array<Array<Dictionary<String, String>>> = [[], [], []]

//Testing recalling data
teams[0].count < (experiencedPlayers.count / teams.count)



/* for each person in the experienced player array, check if the first teams player
 count is less than the total experienced players divided by the amount of teams, if
 it is equals team count then add players to the next team, once that team is equal
 then add remaining to last team
 */

var totalExperiencedPlayers = round(Double(experiencedPlayers.count) / Double(teams.count))

var totalPlayers = round(Double(allPlayers.count) / Double(teams.count))

for var person in experiencedPlayers {
    if Double(teams[0].count) < totalExperiencedPlayers {
        person["Team"] = "Dragons"
       teams[0].append(person)
        
        teams[0]
    } else if Double(teams[1].count) < totalExperiencedPlayers {
        person["Team"] = "Raptors"
        teams[1].append(person)

    } else {
        person["Team"] = "Sharks"
        teams[2].append(person)
    }
}

/* 
 For each person in the inexperienced player array, check if the first teams player
 count is less than the total players (since we have all ready filled the team
 arrays) divided by the amount of teams, if it is equals team count then add players
 to the next team, once that team is equal then add remaining to last team
 */

for var person in inexperiencedPlayers {
    if Double(teams[0].count) < totalPlayers {
        person["Team"] = "Dragons"
        teams[0].append(person)
        
    } else if Double(teams[1].count) < totalPlayers {
        person["Team"] = "Raptors"
        teams[1].append(person)
        
    } else {
        person["Team"] = "Sharks"
        teams[2].append(person)
    }

}


//Checking teams have been filled with players
teams[0].count
teams[1].count
teams[2].count


teams[0]
teams[1]
teams[2]


//Creating the letter

//Reference for pulling data
//var team = teams[0]
//var player = team[0]
//var parents = player["Guardian"] as String!
//var assignedTeam = player["Team"] as String!

/*
 Creating the loop to go into each team then into each player to access the
 different key, value pairs.
*/

for team in teams {
    for var player in team {
        
        //Assigning constants to grab different bits of data
        let assignedTeam = player["Team"] as String!
        let parent = player["Guardian"] as String!
        let playerName = player["Name"] as String!
       
        //Quick test
        print(assignedTeam)
        
        //Setting the practice dates
        if assignedTeam == "Dragons" {
          player["Practice Date"] = "March 17, 1pm"
        } else if assignedTeam == "Raptors" {
            player["Practice Date"] = "March 17, 3pm"
        } else {
            player["Practice Date"] = "March 18, 1pm"
        }
        
        //Setting the constant after creating it above
        let practiceDate = player["Practice Date"] as String!
        
        //The letter
        print("Hello \(parent), Your child, \(playerName) has been assigned to Team \(assignedTeam)! The first training session will be on \(practiceDate). Please make sure you have all the kit ready for that date. Go \(assignedTeam)!! ")
        
    }
}
