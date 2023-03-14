//
//  ContentView.swift
//  BigMountainCoreData
//
//  Created by Tim Mitra on 2023-02-15.
//

import SwiftUI

struct ContentView: View {
  
  @FetchRequest(sortDescriptors: []) private var books: FetchedResults<BookEntity>
  // Core Data automatically makes your entities conform to Identifiable
  
  var body: some View {
    List(books) { book in
      VStack(alignment: .leading, spacing: 12) {
        getImage(imageData: book.cover)
          .resizable()
          .scaledToFit()
        HStack {
          Text(book.title ?? "")
            .font(.title2)
          Spacer()
          Image(systemName: book.available ? "checkmark" : "xmark")
          Text(book.lastUpdated?.formatted(date: .numeric, time: .omitted) ?? "N/A")
          Text("Pages: \(book.pages)")
          Text((book.price ?? 0) as Decimal, format: .currency(code: "USD"))
          Link(destination: book.url ?? URL(string: "https://www.bigmountainstudio.com")!) {
            Text("Learn More")
          }
          Text(book.bookId?.uuidString ?? "")
            .font(.caption2)
        }
        .padding(.vertical)
      }
    }
  }
  func getImage(imageData: Data?) -> Image {
    if let data = imageData, let image = UIImage(data: data) {
      return Image(uiImage: image)
    } else {
      return Image(systemName: "photo.fill")
    }
  }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
