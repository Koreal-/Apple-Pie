//
//  Game.swift
//  Apple Pie
//
//  Created by Kartinin Studio on 21.01.2021.
//

import Foundation

struct Game {
    var word: String
    var incorrectMovesRemaining: Int
    fileprivate var guessedLetters = [Character]()
    
    init(word: String, incorrectMovesRemaining: Int) {
        self.word = word
        self.incorrectMovesRemaining = incorrectMovesRemaining
    }
    
    var guessedWord: String {
        var wordToshow = ""
        for letter in word {
            if guessedLetters.contains(Character(letter.lowercased())) || letter == "-" || letter == " " {
                wordToshow += String(letter)
            } else {
               wordToshow += "_"
            }
        }
        return wordToshow
    }
    
    mutating func playerGuessed(letter: Character) {
        let lowercassedLetter = Character(letter.lowercased())
        guessedLetters.append(lowercassedLetter)
        if !word.lowercased().contains(lowercassedLetter) {
            incorrectMovesRemaining -= 1
        }
    }
}
