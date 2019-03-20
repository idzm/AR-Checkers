//
//  InterestingFactsAboutCheckers.swift
//  AR-Сheckers
//
//  Created by Vakula Maksim on 3/18/19.
//  Copyright © 2019 Vakula Maksim. All rights reserved.
//

import UIKit.UIImage

///https://www.factbuddies.com/2013/10/fun-facts-checkers.html
///http://ezinearticles.com/?Checkers---Facts-and-History&id=971775
enum InterestingFactsAboutCheckers {
    static let allFacts: [String] = [
        InterestingFactsAboutCheckers.numberOne,
        InterestingFactsAboutCheckers.numberTwo,
        InterestingFactsAboutCheckers.numberThree,
        InterestingFactsAboutCheckers.numberFour,
        InterestingFactsAboutCheckers.numberFive,
        InterestingFactsAboutCheckers.numberSix,
        InterestingFactsAboutCheckers.numberSeven,
        InterestingFactsAboutCheckers.numberEight,
        InterestingFactsAboutCheckers.numberNine,
        InterestingFactsAboutCheckers.numberTen,
        InterestingFactsAboutCheckers.numberEleven,
        InterestingFactsAboutCheckers.numberTwelve,
        InterestingFactsAboutCheckers.numberThirteen,
        InterestingFactsAboutCheckers.numberFourteen
    ]
    
    static let numberOne: String =
    "The game of checkers is called \"draughts\" in many countries."
    
    static let numberTwo: String =
    "It comes from an old game called Alquerque."
    
    static let numberThree: String =
    "In 1535 the rule that you had to jump when presented with a jump opportunity was added to the game."
    
    static let numberFour: String =
    "Chess can be played on the same game board as checker"
    
    static let numberFive: String =
    "The next development towards modern checkers is thought to have come from 13th century southern France. The rules and pieces of Alquerque were expanded to be played on an 8 x 8 chess board. The game was called Fierges, the pieces called ferses, the identical name given to the queen in chess."
    
    static let numberSix: String =
    "By the 15th century, the earlier association with the queen in chess saw the name of the game changed to Jeu De Dames, most often shortened to Dames."
    
    static let numberSeven: String =
    "The game of Jeu Force was taken to England where it was called draughts, and finally to North America where it was called checkers."
    
    static let numberEight: String =
    "In France the game of Dames without the forced capture rule was still popular and called Le Jeu Plaisant De Dames, shortened to Plaisant. In the 18th century, the game in France changed to a 10 x 10 grid and 20 pieces on each side. This game is still played and is known as International or Continental Draughts."
    
    static let numberNine: String =
    "The USA currently dominates the game of checkers. But many of the strongest players are in their 60's and 70's. England seems to be coming on strong, with some younger players."
    
    static let numberTen: String =
    "There are international tournaments for both Checkers/Draughts and International Draughts. The first tournament for English Draughts occurred in 1847."
    
    static let numberEleven: String =
    "The game Chinese Checkers has very little to with Checkers and was invented by the Germans, not the Chinese."
    
    static let numberTwelve: String =
    "There are lots of different variants of checkers including a version that is played on a 10x10 board with 20 pieces per player."
    
    static let numberThirteen: String =
    "There are many variants of the game around the world today, but Chinese Checkers is not one of them. The game has nothing to do with China, but originated in Germany. The game was put on the market in the early 1900's and was called Chinese Checkers to capitalize on people' familiarity with checkers and to give the game an oriental flavor, as marketing ploys."
    
    static let numberFourteen: String =
    "By the 16th century, Dames was very popular in France. Variants of the game were many, and one of these was the 'forced capture' variant, where a player had to capture an opponents piece instead of making a different move. This variant became known as Jeu Force."
}

enum GreatPlayers:CaseIterable {
    case first
    case second
    case third
    case fourth
    case fifth
    
    var image: UIImage? {
        switch self {
        case .first:
            return UIImage(named: "Andris_Andreiko")
        case .second:
            return UIImage(named: "Gavril_Kolesov")
        case .third:
            return UIImage(named: "Iosiv_Kuperman")
        case .fourth:
            return UIImage(named: "Nikolai_Struchkov")
        case .fifth:
            return UIImage(named: "Sergei_Belosheev")
        }
    }
    
    var text: String {
        switch self {
        case .first:
            return "Andris Andreiko"
        case .second:
            return "Gavril Kolesov"
        case .third:
            return "Iosiv Kuperman"
        case .fourth:
            return "Nikolai Struchkov"
        case .fifth:
            return "Sergei Belosheev"
        }
    }
}
