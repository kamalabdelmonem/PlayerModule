//
//  Players.swift
//  PlayersAssesment
//
//  Created by kamal abdelmonem on 17/03/2023.



import Foundation

// MARK: - Welcome
struct PlayersResponse: Codable {
    let status: Int?
    let message: String?
    let data: [PlayerItem]?
    let total, perPage: Int?

    enum CodingKeys: String, CodingKey {
        case status, message, data, total
        case perPage = "per_page"
    }
}

// MARK: - Datum
struct PlayerItem: Codable {
    let id, sportID, slug, name: String?
    let nameShort: String?
    let photo: String?
    let position: String?
    let positionName: String?
    let weight, age, dateBirthAt, height: String?
    let shirtNumber: String?
    let preferredFoot: String?
    let nationalityCode, flag: String?
    let marketCurrency: String?
    let marketValue, contractUntil, rating: String?
    let characteristics: Characteristics?
    let ability: [Ability]?
    let teamID, teamCategoryID, teamVenueID, teamManagerID: String?
    let teamSlug, teamName: String?
    let teamLogo: String?
    let teamNameTranslations: TeamNameTranslations?
    let teamNameShort, teamNameFull, teamNameCode, teamHasSub: String?
    let teamGender: String?
    let teamIsNationality, teamCountryCode, teamCountry, teamFlag: String?
    let teamFoundation: String?
    let updated: String?

    enum CodingKeys: String, CodingKey {
        case id
        case sportID = "sport_id"
        case slug, name
        case nameShort = "name_short"
        case photo, position
        case positionName = "position_name"
        case weight, age
        case dateBirthAt = "date_birth_at"
        case height
        case shirtNumber = "shirt_number"
        case preferredFoot = "preferred_foot"
        case nationalityCode = "nationality_code"
        case flag
        case marketCurrency = "market_currency"
        case marketValue = "market_value"
        case contractUntil = "contract_until"
        case rating, characteristics, ability
        case teamID = "team_id"
        case teamCategoryID = "team_category_id"
        case teamVenueID = "team_venue_id"
        case teamManagerID = "team_manager_id"
        case teamSlug = "team_slug"
        case teamName = "team_name"
        case teamLogo = "team_logo"
        case teamNameTranslations = "team_name_translations"
        case teamNameShort = "team_name_short"
        case teamNameFull = "team_name_full"
        case teamNameCode = "team_name_code"
        case teamHasSub = "team_has_sub"
        case teamGender = "team_gender"
        case teamIsNationality = "team_is_nationality"
        case teamCountryCode = "team_country_code"
        case teamCountry = "team_country"
        case teamFlag = "team_flag"
        case teamFoundation = "team_foundation"
        case updated
    }
}

// MARK: - Ability
struct Ability: Codable {
    let name: String?
    let value, fullAverage: Int?

    enum CodingKeys: String, CodingKey {
        case name, value
        case fullAverage = "full_average"
    }
}


// MARK: - Characteristics
struct Characteristics: Codable {
    let positive, negative: [Tive]?
}

// MARK: - Tive
struct Tive: Codable {
    let feature: String?
    let value: Int?
}



// MARK: - TeamNameTranslations
struct TeamNameTranslations: Codable {
    let en, ru, de, es: String?
    let fr, zh, tr, el: String?
    let it, nl, pt: String?
}

