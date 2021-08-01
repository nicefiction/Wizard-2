//
//  Wizard_2App.swift
//  Wizard 2
//
//  Created by Olivier Van hamme on 01/08/2021.
//

import SwiftUI
import CoreData


@main
struct Wizard_2App: App {
   let persistenceController = PersistenceController.shared
   
   var body: some Scene {
      WindowGroup {
         ContentView()
            .environment(\.managedObjectContext, persistenceController.container.viewContext)
      }
   }
}
