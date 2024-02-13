
import SwiftUI
import SwiftData

struct ListView: View {
    @Query private var items: [Msn]
    @StateObject var m = ListViewM()
    @Environment(\.modelContext) var context
    @Environment(\.managedObjectContext) var managedObjContext
    @FetchRequest(sortDescriptors: [SortDescriptor(\.date)]) var Mensagem: FetchedResults<Msg>
    @Environment (\.dismiss) var dismiss
    @FocusState var focus:Bool
 

    @Environment(\.colorScheme) var isDarkMode
    
    @StateObject var cloudKit = CloudKitUserBootcampViewModel()

    var body: some View {
        VStack{
            List{
                ForEach(Mensagem)  { mensagem in
                    HStack{
                        Text(mensagem.mensagem ?? "")
                            .foregroundColor(isDarkMode == .dark ? .white : .black)
                        Spacer()
                        Text(((mensagem.user == cloudKit.userName ? "" : mensagem.user) ?? "") )
                            .foregroundColor(isDarkMode == .dark ? .white : .black)
                    }
                }
//                .onDelete(perform: deletarMsg)
                .onDelete(perform: { indexSet in
                    for index in indexSet{
                        deleteItem(items[index])
                    }
                })
            }
            .listStyle(.plain)
//            .scrollContentBackground(.hidden)
            HStack{
                TextField("Mensagem", text: $m.msg)
                    .foregroundColor(isDarkMode == .dark ? .white : .black)
                    .focused($focus)
                
                
                    .onSubmit {
                        if m.msg != ""{
                            DataController().addMensagem(mensagem: m.msg, user: cloudKit.userName , context: managedObjContext)

                            m.msg = ""
                            dismiss()
                        }
//                        let msn = Msn(mensagem: m.msg, user: cloudKit.userName)
//                        context.insert(Msn(mensagem: m.msg, user: cloudKit.userName))
                    }
                    .gesture(TapGesture().onEnded { _ in
                        focus = false
                    })
            }.padding()
        }
    }
    func deletarMsg(offsets: IndexSet){
        //pass
        withAnimation {
            offsets.map{
                Mensagem[$0]
            }.forEach(managedObjContext.delete)

            DataController().saveData(context: managedObjContext)
        }
    }
    func deleteItem(_ item: Msn){
        context.delete(item)
    }
}

//
//import SwiftUI
//
//struct ListView: View {
//    @State var m = ListViewM()
//    @Environment(\.managedObjectContext) var managedObjContext
//    @FetchRequest(sortDescriptors: [SortDescriptor(\.date)]) var Mensagem: FetchedResults<Msg>
//    @Environment (\.dismiss) var dismiss
//    @FocusState var focus:Bool
//    @State var msg:String = ""
//
//    @Environment(\.colorScheme) var isDarkMode
//    
//    @StateObject var vm = CloudKitUserBootcampViewModel()
//
//    var body: some View {
//        VStack{
//            List{
//                ForEach(Mensagem)  { mensagem in
//                    HStack{
//                        Text(mensagem.mensagem!)
//                            .foregroundColor(isDarkMode == .dark ? .white : .black)
//                        Spacer()
//                        Text((mensagem.user == vm.userName ? "" : mensagem.user) ?? "")
//                            .foregroundColor(isDarkMode == .dark ? .white : .black)
//                    }
//                }
//                .onDelete(perform: deletarMsg)
////                .listRowBackground(isDarkMode == .dark ? Color.accentColor : Color.gray)
//            }
//            .listStyle(.plain)
////            .scrollContentBackground(.hidden)
//            HStack{
//                TextField("Mensagem", text: $msg)
//                    .foregroundColor(isDarkMode == .dark ? .white : .black)
//                    .focused($focus)
//                
//                
//                    .onSubmit {
//                        if msg != ""{
//                            DataController().addMensagem(mensagem: msg, user: vm.userName , context: managedObjContext)
//
//                            msg = ""
//                            dismiss()
//                        }
//                    }
//                    .gesture(TapGesture().onEnded { _ in
//                        focus = false
//                    })
//            }.padding()
//        }
//
//    }
//    private func deletarMsg(offsets: IndexSet){
//        //pass
//        withAnimation {
//            offsets.map{
//                Mensagem[$0]
//            }.forEach(managedObjContext.delete)
//
//            DataController().saveData(context: managedObjContext)
//        }
//    }
//}
