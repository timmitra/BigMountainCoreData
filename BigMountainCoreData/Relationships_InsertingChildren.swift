//
//  Relationships_InsertingChildren.swift
//  BigMountainCoreData
//
//  Created by Tim Mitra on 2023-11-19.
//

import SwiftUI

struct Relationships_InsertingChildren: View {
  @FetchRequest<ManufacturerEntity>(sortDescriptors: []) private var manufacturers
  @State private var newAuto = false
  @State private var selectedManufacturer: ManufacturerEntity?
  
    var body: some View {
      NavigationStack {
        List(manufacturers) { manufacturer in
          Section {
            ForEach(manufacturer.viewAutoEntities) { auto in
              Text("\(auto.viewYear) \(auto.viewModel)")
            }
          } header: {
            HStack {
              Text(manufacturer.viewName)
              Spacer()
              Button {
                selectedManufacturer = manufacturer
                newAuto.toggle()
              } label: {
                Image(systemName: "plus.circle")
              }
            }
          }
        }
        .navigationTitle("Inserting Children")
        .sheet(item: $selectedManufacturer) { manufacturer in
          NewAutoView(manufacturerEntity: manufacturer).presentationDetents([.medium])
        }
      }
    }
}

#Preview {
    Relationships_InsertingChildren()
}
