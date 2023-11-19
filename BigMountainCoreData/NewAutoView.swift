//
//  NewAutoView.swift
//  BigMountainCoreData
//
//  Created by Tim Mitra on 2023-11-19.
//

import SwiftUI

struct NewAutoView: View {
  var manufacturerEntity: ManufacturerEntity
  @Environment(\.managedObjectContext) private var moc
  @Environment(\.dismiss) private var dismiss
  @State private var modelYear = ""
  @State private var modelName = ""

    var body: some View {
      VStack(spacing: 16) {
        Text("New Automobile")
          .font(.largeTitle.weight(.bold))
        HStack {
          TextField("year", text: $modelYear).frame(width: 100)
          TextField("model", text: $modelName)
        }
        .textFieldStyle(.roundedBorder)
        
        Button("Save") {
          let auto = AutoEntity(context: moc)
          auto.year = modelYear
          auto.model = modelName
          manufacturerEntity.addToAutoEntities(auto)
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

//#Preview {
//  var manufacturerEntity: ManufacturerEntity
//  NewAutoView(manufacturerEntity: manufacturerEntity)
//}
