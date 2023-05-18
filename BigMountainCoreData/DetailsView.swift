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
            List {
                VStack {
                    Text("Parks")
                        .badge(parksCount)
                        .font(.title2)
                }
            }
            .task {
                if let count = try? moc.count(for: ParkEntity.fetchRequest()) {
                    parksCount = count
                }
            }
            .navigationTitle("Details")
        }
    }
}

struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsView()
            .environment(\.managedObjectContext, ParksDataContainer(forPreview: true).persistentContainer.viewContext)
    }
}
