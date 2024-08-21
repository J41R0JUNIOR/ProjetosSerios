//
//  Informations.swift
//  iApi Sudoku
//
//  Created by Jairo Júnior on 18/08/23.
//

import Foundation

//class BringInfo: Codable , ObservableObject{
//    let newboard: NewBoard
//}

class BringInfo: Codable, ObservableObject {
    let game: String
    let info: String
    let data: [[Int]]
    let easy: [[Int]]
    let medium: [[Int]]
    let hard: [[Int]]
}


//struct NewBoard: Codable {
//    let grids: [Grid]
//    let results: Int
//    let message: String
//}

//struct NewBoard: Codable {
//    let data: [[Int]]
////    let data: [Grid]
//    let easy: [[Int]]
//    let medium: [[Int]]
//    let hard: [[Int]]
//    let info: String
//}
//
//struct Grid: Codable {
//    let value: [[Int]]
//    let solution: [[Int]]
//    let difficulty: String
//}
//
//
enum ApiError: Error{
    case invalidUrl
    case invalidResponse
    case invalidData
}
