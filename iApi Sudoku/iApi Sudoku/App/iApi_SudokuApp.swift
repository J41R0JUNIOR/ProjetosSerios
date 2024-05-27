//
//  iApi_SudokuApp.swift
//  iApi Sudoku
//
//  Created by Jairo Júnior on 18/08/23.
//

import SwiftUI
import SwiftData

@main
struct iApi_SudokuApp: App {

    @Environment(\.managedObjectContext) var managedObjContext
    
    var body: some Scene {
        WindowGroup {
            MainScreen()/*.modelContainer(for: DataItem.self)*/
        }
    }
}
