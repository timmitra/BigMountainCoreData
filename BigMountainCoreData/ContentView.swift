//
//  ContentView.swift
//  BigMountainCoreData
//
//  Created by Tim Mitra on 2023-02-15.
//

import SwiftUI

struct ContentView: View {
  
//  @FetchRequest(sortDescriptors: []) private var people: FetchedResults<PersonEntity>
  // Core Data automatically makes your entities conform to Identifiable
//  @Environment(\.managedObjectContext) var moc
  
    var body: some View {
        VStack {
//          List(people) { person in
//            Text(person.name ?? "")
//          }
//Button("Add Person") {
//            let person = PersonEntity(context:  moc)
//            person.name = ["Mark", "Lem", "Chase"].randomElement()
//            try? moc.save()
//          }
        }
        .font(.title)
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
