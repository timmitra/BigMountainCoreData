//
//  Relationships_Nested.swift
//  BigMountainCoreData
//
//  Created by Tim Mitra on 2023-11-19.
//

import SwiftUI
import CoreData

struct Relationships_Nested: View {
  @FetchRequest<ManufacturerEntity>(sortDescriptors: [])
  private var manufacturers
  
  var body: some View {
    NavigationStack {
      List(manufacturers) { manufacturer in
        Section {
          ForEach(manufacturer.viewAutoEntities) { auto in
            Text(auto.viewModel)
          }
        } header: {
          Text(manufacturer.viewName)
        }
      }
    }
    .navigationTitle("Nested")
  }
}


#Preview {
    Relationships_Nested()
}
