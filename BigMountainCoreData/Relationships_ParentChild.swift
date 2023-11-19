//
//  RelationshipsView.swift
//  BigMountainCoreData
//
//  Created by Tim Mitra on 2023-11-18.
//

import SwiftUI
import CoreData

struct Relationships_ParentChild: View {
  @FetchRequest<ManufacturerEntity>(sortDescriptors: [])
  private var manufacturers
  
    var body: some View {
      NavigationStack {
        List(manufacturers) { manufacturer in
        NavigationLink(destination: {
          List(manufacturer.viewAutoEntities) { auto in
            Text(auto.model ?? "")
          }
        }, label: {
          Text(manufacturer.name ?? "")
        })
        }
        .navigationTitle("Parent-Child")
      }
    }
}

#Preview {
    Relationships_ParentChild()
}
