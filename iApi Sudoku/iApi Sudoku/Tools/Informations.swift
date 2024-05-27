//
//  Informations.swift
//  iApi Sudoku
//
//  Created by Jairo Júnior on 18/08/23.
//

import Foundation

class BringInfo: Codable , ObservableObject{
    let newboard: NewBoard
}

struct NewBoard: Codable {
    let grids: [Grid]
    let results: Int
    let message: String
}

struct Grid: Codable {
    let value: [[Int]]
    let solution: [[Int]]
    let difficulty: String
}


enum ApiError: Error{
    case invalidUrl
    case invalidResponse
    case invalidData
}
