//
//  DetailsView.swift
//  BigMountainCoreData
//
//  Created by Tim Mitra on 2023-05-17.
//

import SwiftUI

struct DetailsView: View {
    @Environment(\.managedObjectContext) var moc
    @State private var parksCount = 0
    @State private var parkArray: [String] = []
    
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("Parks")
                    .bold()
                    .badge(parksCount)
                    .font(.title2)
                Text(parkArray, format: .list(type: .and, width: .standard))
                    .fixedSize(horizontal: false, vertical: true)
            }
        }
        .task {
            let request = ParkEntity.fetchRequest()
            
            if let parks = try? moc.fetch(request) {
                parksCount = parks.count
                
                for park in parks {
                    parkArray.append(park.viewName)
                }
            }
        }
        .navigationTitle("Details")
    }
}

struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsView()
    }
}
