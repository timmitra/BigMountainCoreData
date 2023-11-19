//
//  NewManufacturer.swift
//  BigMountainCoreData
//
//  Created by Tim Mitra on 2023-11-19.
//

import SwiftUI

struct NewManufacturer: View {
  @Environment(\.managedObjectContext) private var moc
  @Environment(\.dismiss) private var dismiss
  @State private var manufacturerName = ""
  
    var body: some View {
      VStack(spacing: 16.0) {
        Text("New Manufacturer")
          .font(.largeTitle.weight(.bold))
        
        TextField("manufacturer name", text: $manufacturerName)
          .textFieldStyle(.roundedBorder)
        
        Button("Save") {
          let manufacturer = ManufacturerEntity(context: moc)
          manufacturer.name = manufacturerName
          do {
            try moc.save()
            dismiss()
          } catch {
            print(error.localizedDescription)
          }
        }
          .buttonStyle(.borderedProminent)
        
        Spacer()
      }
      .padding()
    }
}

#Preview {
    NewManufacturer()
}
