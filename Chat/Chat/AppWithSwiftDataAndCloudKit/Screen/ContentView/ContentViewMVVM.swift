//
//  ContentViewM.swift
//  Chat
//
//  Created by Jairo Júnior on 01/11/23.
//

import Foundation
import SwiftUI

struct ContentViewMVVM{
    @StateObject var dataController = DataController()

    @Environment(\.managedObjectContext) var managedObjContext
    @FetchRequest(sortDescriptors: [SortDescriptor(\.date)]) var Mensagem: FetchedResults<Msg>
    
    @StateObject var vm = CloudKitUserBootcampViewModel()
}
