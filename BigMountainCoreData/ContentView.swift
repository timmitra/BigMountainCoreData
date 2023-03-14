//
//  ContentView.swift
//  BigMountainCoreData
//
//  Created by Tim Mitra on 2023-02-15.
//

import SwiftUI

struct ContentView: View {
  
  // shorter version of FetchedResults
  @FetchRequest<BookEntity>(sortDescriptors: []) private var books
  // Core Data automatically makes your entities conform to Identifiable
  
  var body: some View {
    List(books) { book in
      VStack(alignment: .leading, spacing: 12) {
        Image(uiImage: book.viewCover)
          .resizable()
          .scaledToFit()
        HStack {
          Text(book.viewTitle)
            .font(.title2)
          Spacer()
          Image(systemName: book.viewAvailability)
          Text(book.viewLastUpdated)
          Text(book.viewPages)
          Text(book.viewPrice)
          Link(destination: book.viewUrl) {
            Text("Learn More")
          }
          Text(book.viewBookId)
        }
        .padding(.vertical)
      }
    }
  }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
