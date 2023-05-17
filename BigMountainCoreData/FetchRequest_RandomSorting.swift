// Copyright © 2022 Big Mountain Studio. All rights reserved. Twitter: @BigMtnStudio

import SwiftUI

struct FetchRequest_RandomSorting: View {
  @FetchRequest<ParkEntity>(sortDescriptors: []) private var parks: FetchedResults
  
  var body: some View {
    NavigationStack {
      List(parks) { park in
        HStack {
          Image(uiImage: park.viewImage)
            .resizable()
            .scaledToFit()
            .frame(height: 60)
            .cornerRadius(8)
          
          VStack(alignment: .leading, spacing: 4) {
            Text(park.viewName)
              .font(.title)
            Text(park.viewLocation)
              .fontWeight(.light)
          }
          
          Spacer()
        }
        .padding(.vertical, 8)
      }
      .navigationTitle("Parks")
    }
  }
}

struct FetchRequest_RandomSorting_Previews: PreviewProvider {
  static var previews: some View {
    FetchRequest_RandomSorting()
      .environment(\.managedObjectContext, ParksDataContainer(forPreview: true).persistentContainer.viewContext)
  }
}
