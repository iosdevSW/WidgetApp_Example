//
//  AppIntents.swift
//  WidgetExampleExtension
//
//  Created by iOS신상우 on 4/15/24.
//

import Foundation
import SwiftUI
import WidgetKit
import AppIntents

struct SelectCharacterIntent: WidgetConfigurationIntent {
    static var title: LocalizedStringResource = "Select Character"
    static var description = IntentDescription("Selects the character to display information for.")


    @Parameter(title: "Character")
    var character: CharacterDetail


    init(character: CharacterDetail) {
        self.character = character
    }


    init() {
    }
}

struct CharacterDetail: AppEntity {
    let id: String
    let avatar: String
    let healthLevel: Double
    let heroType: String
    let isAvailable = true
    
    static var typeDisplayRepresentation: TypeDisplayRepresentation = "Character"
    static var defaultQuery = CharacterQuery()
            
    var displayRepresentation: DisplayRepresentation {
        DisplayRepresentation(title: "\(avatar) \(id)")
    }


    static let allCharacters: [CharacterDetail] = [
        CharacterDetail(id: "Power Panda", avatar: "🐼", healthLevel: 0.14, heroType: "Forest Dweller"),
        CharacterDetail(id: "Unipony", avatar: "🦄", healthLevel: 0.67, heroType: "Free Rangers"),
        CharacterDetail(id: "Spouty", avatar: "🐳", healthLevel: 0.83, heroType: "Deep Sea Goer")
    ]
}

struct CharacterQuery: EntityQuery {
    func entities(for identifiers: [CharacterDetail.ID]) async throws -> [CharacterDetail] {
        CharacterDetail.allCharacters.filter { identifiers.contains($0.id) }
    }
    
    func suggestedEntities() async throws -> [CharacterDetail] {
        CharacterDetail.allCharacters.filter { $0.isAvailable }
    }
    
    func defaultResult() async -> CharacterDetail? {
        try? await suggestedEntities().first
    }
}
