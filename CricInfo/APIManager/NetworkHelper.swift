import Foundation
////
////  APIFixtureHelper.swift
////  CricInfo
////
////  Created by bjit on 8/2/23.
////
//
//import Foundation
//
enum APIError: Error {
    case invalidUrl
    case errorDecode
    case failed(error: Error)
    case unknownError
}

class NetworkHelper{

    static let shared = NetworkHelper()

    private init(){}

    func fetchData<T: Codable>(model:T, completion: @escaping (Result<T,APIError>) -> Void){


    
        guard let url = CricketAPIRepository.shared.getURL(with: .fixtures, parameters: [
            "api_token": Constants.shared.apiToken,
            "fields[fixtures]": Constants.shared.fieldsForMatches,
            "filter[status]": Constants.shared.fieldsForMatches,
            "include" : Constants.shared.includeForMatches,
            "filter[league_id]": "5",
            "page":"1",
            "filter[starts_between]": "2023-02-04T00:00:00,2023-02-04T23:59:00"
            
        
        ])else{
            return
        }
            
        print("url:",url)
        let urlRequest = URLRequest(url: url)

        URLSession.shared.dataTask(with: urlRequest) { data, response, error  in
                    if error != nil {
                        print("dataTask error: \(error!.localizedDescription)")
                        completion(.failure(.failed(error: error!)))
                    } else if let data = data {
                        // Success request
                        do {
                            // 4. Decode json into array of User
                            let getRespose = try JSONDecoder().decode(T.self, from: data)
                            print("success")
//                            self.totalSize += getRespose.totalResults
                            completion(.success(getRespose))
                        } catch {
                            // Send error when decoding
                            print("decoding error")
                            completion(.failure(.errorDecode))
                        }
                    } else {
                        print("unknown dataTask error")
                        completion(.failure(.unknownError))
                    }
                }
                .resume()
    }
}

//
//import Foundation
//
//// MARK: - FixtureAPIResponseModel
//struct FixtureAPIResponseModel: Codable {
//    let data: [Datum]
//    let links: Links
//    let meta: Meta
//}
//
//// MARK: - Datum
//struct Datum: Codable {
//    let resource: DatumResource
//    let id, leagueID, seasonID: Int
//    let round: String
//    let localteamID, visitorteamID: Int
//    let startingAt: String
//    let type: TypeEnum
//    let status: Status
//    let note: String
//    let venueID, tossWonTeamID, winnerTeamID, firstUmpireID: Int?
//    let secondUmpireID, tvUmpireID, refereeID, manOfMatchID: Int?
//    let manOfSeriesID, totalOversPlayed: Int?
//    let elected: Elected?
//    let weatherReport: [JSONAny]
//    let runs: [Run]
//    let lineup: [LineupElement]
//
//    enum CodingKeys: String, CodingKey {
//        case resource, id
//        case leagueID = "league_id"
//        case seasonID = "season_id"
//        case round
//        case localteamID = "localteam_id"
//        case visitorteamID = "visitorteam_id"
//        case startingAt = "starting_at"
//        case type, status, note
//        case venueID = "venue_id"
//        case tossWonTeamID = "toss_won_team_id"
//        case winnerTeamID = "winner_team_id"
//        case firstUmpireID = "first_umpire_id"
//        case secondUmpireID = "second_umpire_id"
//        case tvUmpireID = "tv_umpire_id"
//        case refereeID = "referee_id"
//        case manOfMatchID = "man_of_match_id"
//        case manOfSeriesID = "man_of_series_id"
//        case totalOversPlayed = "total_overs_played"
//        case elected
//        case weatherReport = "weather_report"
//        case runs, lineup
//    }
//}
//
//enum Elected: String, Codable {
//    case batting = "batting"
//    case bowling = "bowling"
//}
//
//// MARK: - LineupElement
//struct LineupElement: Codable {
//    let resource: LineupResource
//    let id, countryID: Int
//    let firstname, lastname, fullname: String
//    let imagePath: String
//    let dateofbirth: String
//    let gender: Gender
//    let battingstyle: Battingstyle?
//    let bowlingstyle: Bowlingstyle?
//    let position: Position
//    let updatedAt: String
//    let lineup: LineupLineup
//
//    enum CodingKeys: String, CodingKey {
//        case resource, id
//        case countryID = "country_id"
//        case firstname, lastname, fullname
//        case imagePath = "image_path"
//        case dateofbirth, gender, battingstyle, bowlingstyle, position
//        case updatedAt = "updated_at"
//        case lineup
//    }
//}
//
//enum Battingstyle: String, Codable {
//    case leftHandBat = "left-hand-bat"
//    case rightHandBat = "right-hand-bat"
//}
//
//enum Bowlingstyle: String, Codable {
//    case leftArmChinaman = "left-arm-chinaman"
//    case leftArmFastMedium = "left-arm-fast-medium"
//    case legbreak = "legbreak"
//    case legbreakGoogly = "legbreak-googly"
//    case rightArmFast = "right-arm-fast"
//    case rightArmFastMedium = "right-arm-fast-medium"
//    case rightArmOffbreak = "right-arm-offbreak"
//    case slowLeftArmOrthodox = "slow-left-arm-orthodox"
//}
//
//enum Gender: String, Codable {
//    case m = "m"
//}
//
//// MARK: - LineupLineup
//struct LineupLineup: Codable {
//    let teamID: Int
//    let captain, wicketkeeper, substitution: Bool
//
//    enum CodingKeys: String, CodingKey {
//        case teamID = "team_id"
//        case captain, wicketkeeper, substitution
//    }
//}
//
//// MARK: - Position
//struct Position: Codable {
//    let resource: PositionResource
//    let id: Int
//    let name: Name
//}
//
//enum Name: String, Codable {
//    case allrounder = "Allrounder"
//    case batsman = "Batsman"
//    case bowler = "Bowler"
//    case wicketkeeper = "Wicketkeeper"
//}
//
//enum PositionResource: String, Codable {
//    case positions = "positions"
//}
//
//enum LineupResource: String, Codable {
//    case players = "players"
//}
//
//enum DatumResource: String, Codable {
//    case fixtures = "fixtures"
//}
//
//// MARK: - Run
//struct Run: Codable {
//    let resource: RunResource
//    let id, fixtureID, teamID, inning: Int
//    let score, wickets: Int
//    let overs: Double
//    let pp1: Pp1
//    let pp2: String?
//    let pp3: JSONNull?
//    let updatedAt: String
//
//    enum CodingKeys: String, CodingKey {
//        case resource, id
//        case fixtureID = "fixture_id"
//        case teamID = "team_id"
//        case inning, score, wickets, overs, pp1, pp2, pp3
//        case updatedAt = "updated_at"
//    }
//}
//
//enum Pp1: String, Codable {
//    case the12 = "1-2"
//    case the13 = "1-3"
//    case the14 = "1-4"
//    case the16 = "1-6"
//}
//
//enum RunResource: String, Codable {
//    case runs = "runs"
//}
//
//enum Status: String, Codable {
//    case aban = "Aban."
//    case finished = "Finished"
//    case ns = "NS"
//}
//
//enum TypeEnum: String, Codable {
//    case t20 = "T20"
//    case t20I = "T20I"
//}
//
//// MARK: - Links
//struct Links: Codable {
//    let first, last: String
//    let prev: JSONNull?
//    let next: String
//}
//
//// MARK: - Meta
//struct Meta: Codable {
//    let currentPage, from, lastPage: Int
//    let links: [Link]
//    let path: String
//    let perPage, to, total: Int
//
//    enum CodingKeys: String, CodingKey {
//        case currentPage = "current_page"
//        case from
//        case lastPage = "last_page"
//        case links, path
//        case perPage = "per_page"
//        case to, total
//    }
//}
//
//// MARK: - Link
//struct Link: Codable {
//    let url: String?
//    let label: String
//    let active: Bool
//}
//
//// MARK: - Encode/decode helpers
//
//class JSONNull: Codable, Hashable {
//
//    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
//        return true
//    }
//
//    public var hashValue: Int {
//        return 0
//    }
//
//    public init() {}
//
//    public required init(from decoder: Decoder) throws {
//        let container = try decoder.singleValueContainer()
//        if !container.decodeNil() {
//            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
//        }
//    }
//
//    public func encode(to encoder: Encoder) throws {
//        var container = encoder.singleValueContainer()
//        try container.encodeNil()
//    }
//}
//
//class JSONCodingKey: CodingKey {
//    let key: String
//
//    required init?(intValue: Int) {
//        return nil
//    }
//
//    required init?(stringValue: String) {
//        key = stringValue
//    }
//
//    var intValue: Int? {
//        return nil
//    }
//
//    var stringValue: String {
//        return key
//    }
//}
//
//class JSONAny: Codable {
//
//    let value: Any
//
//    static func decodingError(forCodingPath codingPath: [CodingKey]) -> DecodingError {
//        let context = DecodingError.Context(codingPath: codingPath, debugDescription: "Cannot decode JSONAny")
//        return DecodingError.typeMismatch(JSONAny.self, context)
//    }
//
//    static func encodingError(forValue value: Any, codingPath: [CodingKey]) -> EncodingError {
//        let context = EncodingError.Context(codingPath: codingPath, debugDescription: "Cannot encode JSONAny")
//        return EncodingError.invalidValue(value, context)
//    }
//
//    static func decode(from container: SingleValueDecodingContainer) throws -> Any {
//        if let value = try? container.decode(Bool.self) {
//            return value
//        }
//        if let value = try? container.decode(Int64.self) {
//            return value
//        }
//        if let value = try? container.decode(Double.self) {
//            return value
//        }
//        if let value = try? container.decode(String.self) {
//            return value
//        }
//        if container.decodeNil() {
//            return JSONNull()
//        }
//        throw decodingError(forCodingPath: container.codingPath)
//    }
//
//    static func decode(from container: inout UnkeyedDecodingContainer) throws -> Any {
//        if let value = try? container.decode(Bool.self) {
//            return value
//        }
//        if let value = try? container.decode(Int64.self) {
//            return value
//        }
//        if let value = try? container.decode(Double.self) {
//            return value
//        }
//        if let value = try? container.decode(String.self) {
//            return value
//        }
//        if let value = try? container.decodeNil() {
//            if value {
//                return JSONNull()
//            }
//        }
//        if var container = try? container.nestedUnkeyedContainer() {
//            return try decodeArray(from: &container)
//        }
//        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self) {
//            return try decodeDictionary(from: &container)
//        }
//        throw decodingError(forCodingPath: container.codingPath)
//    }
//
//    static func decode(from container: inout KeyedDecodingContainer<JSONCodingKey>, forKey key: JSONCodingKey) throws -> Any {
//        if let value = try? container.decode(Bool.self, forKey: key) {
//            return value
//        }
//        if let value = try? container.decode(Int64.self, forKey: key) {
//            return value
//        }
//        if let value = try? container.decode(Double.self, forKey: key) {
//            return value
//        }
//        if let value = try? container.decode(String.self, forKey: key) {
//            return value
//        }
//        if let value = try? container.decodeNil(forKey: key) {
//            if value {
//                return JSONNull()
//            }
//        }
//        if var container = try? container.nestedUnkeyedContainer(forKey: key) {
//            return try decodeArray(from: &container)
//        }
//        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key) {
//            return try decodeDictionary(from: &container)
//        }
//        throw decodingError(forCodingPath: container.codingPath)
//    }
//
//    static func decodeArray(from container: inout UnkeyedDecodingContainer) throws -> [Any] {
//        var arr: [Any] = []
//        while !container.isAtEnd {
//            let value = try decode(from: &container)
//            arr.append(value)
//        }
//        return arr
//    }
//
//    static func decodeDictionary(from container: inout KeyedDecodingContainer<JSONCodingKey>) throws -> [String: Any] {
//        var dict = [String: Any]()
//        for key in container.allKeys {
//            let value = try decode(from: &container, forKey: key)
//            dict[key.stringValue] = value
//        }
//        return dict
//    }
//
//    static func encode(to container: inout UnkeyedEncodingContainer, array: [Any]) throws {
//        for value in array {
//            if let value = value as? Bool {
//                try container.encode(value)
//            } else if let value = value as? Int64 {
//                try container.encode(value)
//            } else if let value = value as? Double {
//                try container.encode(value)
//            } else if let value = value as? String {
//                try container.encode(value)
//            } else if value is JSONNull {
//                try container.encodeNil()
//            } else if let value = value as? [Any] {
//                var container = container.nestedUnkeyedContainer()
//                try encode(to: &container, array: value)
//            } else if let value = value as? [String: Any] {
//                var container = container.nestedContainer(keyedBy: JSONCodingKey.self)
//                try encode(to: &container, dictionary: value)
//            } else {
//                throw encodingError(forValue: value, codingPath: container.codingPath)
//            }
//        }
//    }
//
//    static func encode(to container: inout KeyedEncodingContainer<JSONCodingKey>, dictionary: [String: Any]) throws {
//        for (key, value) in dictionary {
//            let key = JSONCodingKey(stringValue: key)!
//            if let value = value as? Bool {
//                try container.encode(value, forKey: key)
//            } else if let value = value as? Int64 {
//                try container.encode(value, forKey: key)
//            } else if let value = value as? Double {
//                try container.encode(value, forKey: key)
//            } else if let value = value as? String {
//                try container.encode(value, forKey: key)
//            } else if value is JSONNull {
//                try container.encodeNil(forKey: key)
//            } else if let value = value as? [Any] {
//                var container = container.nestedUnkeyedContainer(forKey: key)
//                try encode(to: &container, array: value)
//            } else if let value = value as? [String: Any] {
//                var container = container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key)
//                try encode(to: &container, dictionary: value)
//            } else {
//                throw encodingError(forValue: value, codingPath: container.codingPath)
//            }
//        }
//    }
//
//    static func encode(to container: inout SingleValueEncodingContainer, value: Any) throws {
//        if let value = value as? Bool {
//            try container.encode(value)
//        } else if let value = value as? Int64 {
//            try container.encode(value)
//        } else if let value = value as? Double {
//            try container.encode(value)
//        } else if let value = value as? String {
//            try container.encode(value)
//        } else if value is JSONNull {
//            try container.encodeNil()
//        } else {
//            throw encodingError(forValue: value, codingPath: container.codingPath)
//        }
//    }
//
//    public required init(from decoder: Decoder) throws {
//        if var arrayContainer = try? decoder.unkeyedContainer() {
//            self.value = try JSONAny.decodeArray(from: &arrayContainer)
//        } else if var container = try? decoder.container(keyedBy: JSONCodingKey.self) {
//            self.value = try JSONAny.decodeDictionary(from: &container)
//        } else {
//            let container = try decoder.singleValueContainer()
//            self.value = try JSONAny.decode(from: container)
//        }
//    }
//
//    public func encode(to encoder: Encoder) throws {
//        if let arr = self.value as? [Any] {
//            var container = encoder.unkeyedContainer()
//            try JSONAny.encode(to: &container, array: arr)
//        } else if let dict = self.value as? [String: Any] {
//            var container = encoder.container(keyedBy: JSONCodingKey.self)
//            try JSONAny.encode(to: &container, dictionary: dict)
//        } else {
//            var container = encoder.singleValueContainer()
//            try JSONAny.encode(to: &container, value: self.value)
//        }
//    }
//}
