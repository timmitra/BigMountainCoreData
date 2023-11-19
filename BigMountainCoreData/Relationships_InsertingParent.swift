//
//  Relationships_InsertingParent.swift
//  BigMountainCoreData
//
//  Created by Tim Mitra on 2023-11-19.
//

import SwiftUI

struct Relationships_InsertingParent: View {
  @FetchRequest<ManufacturerEntity>(sortDescriptors: [])
  private var manufacturers
  @State private var newManufacturer = false
  
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
        .navigationTitle("Inserting a Parent")
        .toolbar {
          ToolbarItem {
            Button {
              newManufacturer.toggle()
            } label: {
              Image(systemName: "plus")
            }
          }
        }
        .sheet(isPresented: $newManufacturer) {
          NewManufacturer().presentationDetents([.medium])
        }
      }
    }
  }
}


#Preview {
    Relationships_InsertingParent()
}
