//
//  ContentView.swift
//  BigMountainCoreData
//
//  Created by Tim Mitra on 2023-02-15.
//

import SwiftUI
import CoreData

extension ParkEntity {
    
    static var firstFive1: NSFetchRequest<ParkEntity> {
        let request = ParkEntity.fetchRequest()
        
        request.sortDescriptors = [NSSortDescriptor(keyPath: \ParkEntity.name, ascending: true)]
        request.fetchLimit = 5
        
        return request
    }
}

struct ContentView: View {
    
    @State private var searchText = ""
  
  // shorter version of FetchedResults
    @FetchRequest(fetchRequest: ParkEntity.firstFive)
    private var parks
  // Core Data automatically makes your entities conform to Identifiable
  
    var body: some View {
        NavigationStack {
            List(parks) { park in
                HStack {
                    Image(uiImage: park.viewImage)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 60)
                        .cornerRadius(8)
                    
                    VStack(alignment: .leading, spacing: 4){
                        Text(park.viewName)
                            .font(.title)
                        Text(park.viewLocation)
                            .fontWeight(.light)
                    }
                    
                    Spacer()
                }
                .padding(.vertical, 8)
            }
            .safeAreaInset(edge: .bottom) {
                VStack {
                    Divider()
                    Text("Total Parks: \(parks.count)")
                }
            }
            .navigationTitle("Parks")
       }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environment(\.managedObjectContext, ParksDataContainer(forPreview: true).persistentContainer.viewContext)
    }
}
