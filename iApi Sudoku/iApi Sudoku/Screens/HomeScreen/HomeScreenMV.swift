//
//  HomeScreenM.swift
//  iApi Sudoku
//
//  Created by Jairo Júnior on 26/10/23.
//

import Foundation
import SwiftUI

@MainActor
class HomeScreenMV: ObservableObject {
    @Published var sudoku: BringInfo?
    @Published var gameGrid: [[Int]] = [[]]
    @Published var solutionGrid: [[Int]] = [[]]
    
//    @StateObject var model = HomeScreenM()

    func newGame() async {
        do {
            sudoku = try await newBoard()
            gameGrid = (sudoku?.newboard.grids[0].value) ?? [[]]
            solutionGrid = (sudoku?.newboard.grids[0].solution) ?? [[]]
            
        } catch ApiError.invalidUrl{
            print("Invalid URL")
        } catch ApiError.invalidResponse{
            print("Invalid Response")
        } catch ApiError.invalidData{
            print("Invalid Data")
        } catch {
            print("Unexpected error")
        }
    }

    func newBoard() async throws -> BringInfo {
        let endpoint = "https://sudoku-api.vercel.app/api/dosuku"

        guard let url = URL(string: endpoint) else {
            throw ApiError.invalidUrl
        }

        let (data, response) = try await URLSession.shared.data(from: url)

        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw ApiError.invalidResponse
        }

        do {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let bringInfo = try decoder.decode(BringInfo.self, from: data)
            return bringInfo
        } catch {
            print("Error decoding: \(error)")
            throw ApiError.invalidData
        }
    }
}
