//
//  Constants.swift
//  CricInfo
//
//  Created by bjit on 8/2/23.
//

import Foundation


class Constants{
    
    static let shared = Constants()
    
    private init(){}
    
    let rootAPI = "https://cricket.sportmonks.com/api/v2.0/fixtures"
    let apiToken = "RH6ltRSihWDXEAyFhBIs4Rctw8caQbx6vWtGTRcYpquYTzIbQpJg0hoiNTWm"
    let fieldsForMatches = "league_id,season_id,round,localteam_id,visitorteam_id,starting_at,type,status,note,venue_id,toss_won_team_id,winner_team_id,first_umpire_id,second_umpire_id,tv_umpire_id,referee_id,man_of_match_id,man_of_series_id,total_overs_played,elected"
    
    let includeForMatches = "runs,lineup,bowling,batting,league,visitorteam,localteam,venue"
    
}
