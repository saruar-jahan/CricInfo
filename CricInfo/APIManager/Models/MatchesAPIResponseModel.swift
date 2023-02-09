//
//  MatchesAPIResponseModel.swift
//  CricInfo
//
//  Created by bjit on 9/2/23.
//

import Foundation



// MARK: - MatchesAPIResponseModel
struct MatchesAPIResponseModel: Codable {
    let data: [Datum]
    let links: Links
    let meta: Meta
}

// MARK: - Datum
struct Datum: Codable {
    let resource: String
    let id, leagueID, seasonID: Int
    let round: String
    let localteamID, visitorteamID: Int
    let startingAt, type, status, note: String
    let venueID, tossWonTeamID, winnerTeamID, firstUmpireID: Int
    let secondUmpireID, tvUmpireID, refereeID, manOfMatchID: Int
    let manOfSeriesID: JSONNull?
    let totalOversPlayed: Int
    let elected: String
    let weatherReport: [JSONAny]
    let league, localteam, visitorteam: League
    let batting: [Batting]
    let bowling: [Bowling]
    let runs: [Run]
    let lineup: [LineupElement]
    let venue: Venue

    enum CodingKeys: String, CodingKey {
        case resource, id
        case leagueID = "league_id"
        case seasonID = "season_id"
        case round
        case localteamID = "localteam_id"
        case visitorteamID = "visitorteam_id"
        case startingAt = "starting_at"
        case type, status, note
        case venueID = "venue_id"
        case tossWonTeamID = "toss_won_team_id"
        case winnerTeamID = "winner_team_id"
        case firstUmpireID = "first_umpire_id"
        case secondUmpireID = "second_umpire_id"
        case tvUmpireID = "tv_umpire_id"
        case refereeID = "referee_id"
        case manOfMatchID = "man_of_match_id"
        case manOfSeriesID = "man_of_series_id"
        case totalOversPlayed = "total_overs_played"
        case elected
        case weatherReport = "weather_report"
        case league, localteam, visitorteam, batting, bowling, runs, lineup, venue
    }
}

// MARK: - Batting
struct Batting: Codable {
    let resource: BattingResource
    let id, sort, fixtureID, teamID: Int
    let active: Bool
    let scoreboard: Scoreboard
    let playerID, ball, scoreID, score: Int
    let fourX, sixX: Int
    let catchStumpPlayerID, runoutByID: Int?
    let batsmanoutID: JSONNull?
    let bowlingPlayerID: Int?
    let fowScore: Int
    let fowBalls: Double
    let rate: Int
    let updatedAt: UpdatedAt

    enum CodingKeys: String, CodingKey {
        case resource, id, sort
        case fixtureID = "fixture_id"
        case teamID = "team_id"
        case active, scoreboard
        case playerID = "player_id"
        case ball
        case scoreID = "score_id"
        case score
        case fourX = "four_x"
        case sixX = "six_x"
        case catchStumpPlayerID = "catch_stump_player_id"
        case runoutByID = "runout_by_id"
        case batsmanoutID = "batsmanout_id"
        case bowlingPlayerID = "bowling_player_id"
        case fowScore = "fow_score"
        case fowBalls = "fow_balls"
        case rate
        case updatedAt = "updated_at"
    }
}

enum BattingResource: String, Codable {
    case battings = "battings"
}

enum Scoreboard: String, Codable {
    case s1 = "S1"
    case s2 = "S2"
}

enum UpdatedAt: String, Codable {
    case the20230204T115944000000Z = "2023-02-04T11:59:44.000000Z"
}

// MARK: - Bowling
struct Bowling: Codable {
    let resource: BowlingResource
    let id, sort, fixtureID, teamID: Int
    let active: Bool
    let scoreboard: Scoreboard
    let playerID: Int
    let overs: Double
    let medians, runs, wickets, wide: Int
    let noball: Int
    let rate: Double
    let updatedAt: UpdatedAt

    enum CodingKeys: String, CodingKey {
        case resource, id, sort
        case fixtureID = "fixture_id"
        case teamID = "team_id"
        case active, scoreboard
        case playerID = "player_id"
        case overs, medians, runs, wickets, wide, noball, rate
        case updatedAt = "updated_at"
    }
}

enum BowlingResource: String, Codable {
    case bowlings = "bowlings"
}

// MARK: - League
struct League: Codable {
    let resource: String
    let id: Int
    let seasonID: Int?
    let countryID: Int
    let name, code: String
    let imagePath: String
    let type: String?
    let updatedAt: String
    let nationalTeam: Bool?

    enum CodingKeys: String, CodingKey {
        case resource, id
        case seasonID = "season_id"
        case countryID = "country_id"
        case name, code
        case imagePath = "image_path"
        case type
        case updatedAt = "updated_at"
        case nationalTeam = "national_team"
    }
}

// MARK: - LineupElement
struct LineupElement: Codable {
    let resource: LineupResource
    let id, countryID: Int
    let firstname, lastname, fullname: String
    let imagePath: String
    let dateofbirth: String
    let gender: Gender
    let battingstyle: Battingstyle
    let bowlingstyle: String?
    let position: Position
    let updatedAt: String
    let lineup: LineupLineup

    enum CodingKeys: String, CodingKey {
        case resource, id
        case countryID = "country_id"
        case firstname, lastname, fullname
        case imagePath = "image_path"
        case dateofbirth, gender, battingstyle, bowlingstyle, position
        case updatedAt = "updated_at"
        case lineup
    }
}

enum Battingstyle: String, Codable {
    case leftHandBat = "left-hand-bat"
    case rightHandBat = "right-hand-bat"
}

enum Gender: String, Codable {
    case m = "m"
}

// MARK: - LineupLineup
struct LineupLineup: Codable {
    let teamID: Int
    let captain, wicketkeeper, substitution: Bool

    enum CodingKeys: String, CodingKey {
        case teamID = "team_id"
        case captain, wicketkeeper, substitution
    }
}

// MARK: - Position
struct Position: Codable {
    let resource: PositionResource
    let id: Int
    let name: Name
}

enum Name: String, Codable {
    case allrounder = "Allrounder"
    case batsman = "Batsman"
    case bowler = "Bowler"
    case wicketkeeper = "Wicketkeeper"
}

enum PositionResource: String, Codable {
    case positions = "positions"
}

enum LineupResource: String, Codable {
    case players = "players"
}

// MARK: - Run
struct Run: Codable {
    let resource: String
    let id, fixtureID, teamID, inning: Int
    let score, wickets: Int
    let overs: Double
    let pp1, pp2: String
    let pp3: JSONNull?
    let updatedAt: String

    enum CodingKeys: String, CodingKey {
        case resource, id
        case fixtureID = "fixture_id"
        case teamID = "team_id"
        case inning, score, wickets, overs, pp1, pp2, pp3
        case updatedAt = "updated_at"
    }
}

// MARK: - Venue
struct Venue: Codable {
    let resource: String
    let id, countryID: Int
    let name, city: String
    let imagePath: String
    let capacity: Int
    let floodlight: Bool
    let updatedAt: String

    enum CodingKeys: String, CodingKey {
        case resource, id
        case countryID = "country_id"
        case name, city
        case imagePath = "image_path"
        case capacity, floodlight
        case updatedAt = "updated_at"
    }
}

// MARK: - Links
struct Links: Codable {
    let first, last: String
    let prev, next: JSONNull?
}

// MARK: - Meta
struct Meta: Codable {
    let currentPage, from, lastPage: Int
    let links: [Link]
    let path: String
    let perPage, to, total: Int

    enum CodingKeys: String, CodingKey {
        case currentPage = "current_page"
        case from
        case lastPage = "last_page"
        case links, path
        case perPage = "per_page"
        case to, total
    }
}

// MARK: - Link
struct Link: Codable {
    let url: String?
    let label: String
    let active: Bool
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}

class JSONCodingKey: CodingKey {
    let key: String

    required init?(intValue: Int) {
        return nil
    }

    required init?(stringValue: String) {
        key = stringValue
    }

    var intValue: Int? {
        return nil
    }

    var stringValue: String {
        return key
    }
}

class JSONAny: Codable {

    let value: Any

    static func decodingError(forCodingPath codingPath: [CodingKey]) -> DecodingError {
        let context = DecodingError.Context(codingPath: codingPath, debugDescription: "Cannot decode JSONAny")
        return DecodingError.typeMismatch(JSONAny.self, context)
    }

    static func encodingError(forValue value: Any, codingPath: [CodingKey]) -> EncodingError {
        let context = EncodingError.Context(codingPath: codingPath, debugDescription: "Cannot encode JSONAny")
        return EncodingError.invalidValue(value, context)
    }

    static func decode(from container: SingleValueDecodingContainer) throws -> Any {
        if let value = try? container.decode(Bool.self) {
            return value
        }
        if let value = try? container.decode(Int64.self) {
            return value
        }
        if let value = try? container.decode(Double.self) {
            return value
        }
        if let value = try? container.decode(String.self) {
            return value
        }
        if container.decodeNil() {
            return JSONNull()
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decode(from container: inout UnkeyedDecodingContainer) throws -> Any {
        if let value = try? container.decode(Bool.self) {
            return value
        }
        if let value = try? container.decode(Int64.self) {
            return value
        }
        if let value = try? container.decode(Double.self) {
            return value
        }
        if let value = try? container.decode(String.self) {
            return value
        }
        if let value = try? container.decodeNil() {
            if value {
                return JSONNull()
            }
        }
        if var container = try? container.nestedUnkeyedContainer() {
            return try decodeArray(from: &container)
        }
        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self) {
            return try decodeDictionary(from: &container)
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decode(from container: inout KeyedDecodingContainer<JSONCodingKey>, forKey key: JSONCodingKey) throws -> Any {
        if let value = try? container.decode(Bool.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(Int64.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(Double.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(String.self, forKey: key) {
            return value
        }
        if let value = try? container.decodeNil(forKey: key) {
            if value {
                return JSONNull()
            }
        }
        if var container = try? container.nestedUnkeyedContainer(forKey: key) {
            return try decodeArray(from: &container)
        }
        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key) {
            return try decodeDictionary(from: &container)
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decodeArray(from container: inout UnkeyedDecodingContainer) throws -> [Any] {
        var arr: [Any] = []
        while !container.isAtEnd {
            let value = try decode(from: &container)
            arr.append(value)
        }
        return arr
    }

    static func decodeDictionary(from container: inout KeyedDecodingContainer<JSONCodingKey>) throws -> [String: Any] {
        var dict = [String: Any]()
        for key in container.allKeys {
            let value = try decode(from: &container, forKey: key)
            dict[key.stringValue] = value
        }
        return dict
    }

    static func encode(to container: inout UnkeyedEncodingContainer, array: [Any]) throws {
        for value in array {
            if let value = value as? Bool {
                try container.encode(value)
            } else if let value = value as? Int64 {
                try container.encode(value)
            } else if let value = value as? Double {
                try container.encode(value)
            } else if let value = value as? String {
                try container.encode(value)
            } else if value is JSONNull {
                try container.encodeNil()
            } else if let value = value as? [Any] {
                var container = container.nestedUnkeyedContainer()
                try encode(to: &container, array: value)
            } else if let value = value as? [String: Any] {
                var container = container.nestedContainer(keyedBy: JSONCodingKey.self)
                try encode(to: &container, dictionary: value)
            } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }
    }

    static func encode(to container: inout KeyedEncodingContainer<JSONCodingKey>, dictionary: [String: Any]) throws {
        for (key, value) in dictionary {
            let key = JSONCodingKey(stringValue: key)!
            if let value = value as? Bool {
                try container.encode(value, forKey: key)
            } else if let value = value as? Int64 {
                try container.encode(value, forKey: key)
            } else if let value = value as? Double {
                try container.encode(value, forKey: key)
            } else if let value = value as? String {
                try container.encode(value, forKey: key)
            } else if value is JSONNull {
                try container.encodeNil(forKey: key)
            } else if let value = value as? [Any] {
                var container = container.nestedUnkeyedContainer(forKey: key)
                try encode(to: &container, array: value)
            } else if let value = value as? [String: Any] {
                var container = container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key)
                try encode(to: &container, dictionary: value)
            } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }
    }

    static func encode(to container: inout SingleValueEncodingContainer, value: Any) throws {
        if let value = value as? Bool {
            try container.encode(value)
        } else if let value = value as? Int64 {
            try container.encode(value)
        } else if let value = value as? Double {
            try container.encode(value)
        } else if let value = value as? String {
            try container.encode(value)
        } else if value is JSONNull {
            try container.encodeNil()
        } else {
            throw encodingError(forValue: value, codingPath: container.codingPath)
        }
    }

    public required init(from decoder: Decoder) throws {
        if var arrayContainer = try? decoder.unkeyedContainer() {
            self.value = try JSONAny.decodeArray(from: &arrayContainer)
        } else if var container = try? decoder.container(keyedBy: JSONCodingKey.self) {
            self.value = try JSONAny.decodeDictionary(from: &container)
        } else {
            let container = try decoder.singleValueContainer()
            self.value = try JSONAny.decode(from: container)
        }
    }

    public func encode(to encoder: Encoder) throws {
        if let arr = self.value as? [Any] {
            var container = encoder.unkeyedContainer()
            try JSONAny.encode(to: &container, array: arr)
        } else if let dict = self.value as? [String: Any] {
            var container = encoder.container(keyedBy: JSONCodingKey.self)
            try JSONAny.encode(to: &container, dictionary: dict)
        } else {
            var container = encoder.singleValueContainer()
            try JSONAny.encode(to: &container, value: self.value)
        }
    }
}
