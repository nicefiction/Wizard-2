// ContentView.swift

// MARK: - LIBRARIES -

import SwiftUI
import CoreData



struct ContentView: View {
   
   // MARK: - PROPERTY WRAPPERS
   
   @Environment(\.managedObjectContext) var moc
   @FetchRequest(entity: Wizard.entity(),
                 sortDescriptors: []) var wizards: FetchedResults<Wizard>
   
   
   
   // MARK: - COMPUTED PROPERTIES
   
   var body: some View {
      
      VStack {
         List {
            ForEach(wizards,
                    id: \.self) { (wizard: Wizard) in
               Text(wizard.computedName)
            }
         }
         Group {
            Button("Create Wizard") {
               let newWizard = Wizard(context: self.moc)
               newWizard.name = "Dorothy Gale"
            }
            Button("Save Wizard") {
               if moc.hasChanges {
                  try? moc.save()
                  do {
                     try moc.save()
                  } catch let error {
                     print(error.localizedDescription)
                  }
               }
            }
         }
         .padding()
      }
   }
}





// MARK: - PREVIEWS -

struct ContentView_Previews: PreviewProvider {
   
   static var previews: some View {
      
      ContentView()
   }
}
