//
//  ContentView.swift
//  BigMountainCoreData
//
//  Created by Tim Mitra on 2023-02-15.
//

import SwiftUI

struct ContentView: View {
  
  @FetchRequest(sortDescriptors: []) private var people: FetchedResults<PersonEntity>
  // Core Data automatically makes your entities conform to Identifiable
  
    var body: some View {
        VStack {
          List(people) { person in
            Text(person.name ?? "")
          }
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
