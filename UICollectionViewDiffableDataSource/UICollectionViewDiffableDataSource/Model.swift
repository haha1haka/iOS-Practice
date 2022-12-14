//
//  Model.swift
//  UICollectionViewDiffableDataSource
//
//  Created by HWAKSEONG KIM on 2022/09/08.
//

import UIKit

struct Emoji: Hashable {

    enum Category: CaseIterable, CustomStringConvertible {
        case recents, smileys, nature, food, activities, travel, objects, symbols
    }

    let text: String
    let title: String
    let category: Category
    private let identifier = UUID()
}

extension Emoji.Category {

    var description: String {
        switch self {
        case .recents: return "Recents"
        case .smileys: return "Smileys"
        case .nature: return "Nature"
        case .food: return "Food"
        case .activities: return "Activities"
        case .travel: return "Travel"
        case .objects: return "Objects"
        case .symbols: return "Symbols"
        }
    }

    var emojis: [Emoji] {
        switch self {
        case .recents:
            return [
                Emoji(text: "π€£", title: "Rolling on the floor laughing", category: self),
                Emoji(text: "π₯", title: "Whiskey", category: self),
                Emoji(text: "π", title: "Cool", category: self),
                Emoji(text: "π", title: "Mountains", category: self),
                Emoji(text: "βΊοΈ", title: "Camping", category: self),
                Emoji(text: "βοΈ", title: "ο£Ώ Watch", category: self),
                Emoji(text: "π―", title: "Best", category: self),
                Emoji(text: "β", title: "LGTM", category: self)
            ]

        case .smileys:
            return [
                Emoji(text: "π", title: "Happy", category: self),
                Emoji(text: "π", title: "Laughing", category: self),
                Emoji(text: "π€£", title: "Rolling on the floor laughing", category: self)
            ]

        case .nature:
            return [
                Emoji(text: "π¦", title: "Fox", category: self),
                Emoji(text: "π", title: "Bee", category: self),
                Emoji(text: "π’", title: "Turtle", category: self)
            ]

        case .food:
            return [
                Emoji(text: "π₯", title: "Whiskey", category: self),
                Emoji(text: "π", title: "Apple", category: self),
                Emoji(text: "π", title: "Peach", category: self)
            ]
        case .activities:
            return [
                Emoji(text: "π", title: "Football", category: self),
                Emoji(text: "π΄ββοΈ", title: "Cycling", category: self),
                Emoji(text: "π€", title: "Singing", category: self)
            ]

        case .travel:
            return [
                Emoji(text: "π", title: "Mountains", category: self),
                Emoji(text: "βΊοΈ", title: "Camping", category: self),
                Emoji(text: "π", title: "Beach", category: self)
            ]

        case .objects:
            return [
                Emoji(text: "π₯", title: "iMac", category: self),
                Emoji(text: "βοΈ", title: "ο£Ώ Watch", category: self),
                Emoji(text: "π±", title: "iPhone", category: self)
            ]

        case .symbols:
            return [
                Emoji(text: "β€οΈ", title: "Love", category: self),
                Emoji(text: "β?οΈ", title: "Peace", category: self),
                Emoji(text: "π―", title: "Best", category: self)
            ]

        }
    }
}
