//
//  BookData+Extension.swift
//  BigMountainCoreData
//
//  Created by Tim Mitra on 2023-03-14.
//

import UIKit

//Handle nils and formatting
extension BookEntity {
  
  var viewCover: UIImage {
    if let data = cover, let image = UIImage(data: data) {
      return image
    } else {
      return UIImage(systemName: "note.text")! // SF Symbol
    }
  }
  var viewTitle: String {
    title ?? "No Book Title"
  }
  var viewAvailability: String {
    available ? "checkmark" : "mark"
  }
  var viewLastUpdated: String {
    return "Last updated: " + (lastUpdated?.formatted(date: .numeric, time: .omitted) ?? "N/A")
  }
  var viewPages: String {
    "Pages: \(pages)"
  }
  var viewPrice: String {
    let formatter = NumberFormatter()
    formatter.locale = Locale.current
    formatter.numberStyle = .currency
    return formatter.string(from: price ?? 0)!
  }
  var viewUrl: URL {
    url ?? URL(string: "https://bigmountainstudio.com")!
  }
  var viewBookId: String {
    bookId?.uuidString ?? ""
  }
}
