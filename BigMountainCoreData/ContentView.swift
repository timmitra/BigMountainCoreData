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
    
    @SectionedFetchRequest<String?, ParkEntity>(sectionIdentifier: \.country, sortDescriptors: [SortDescriptor(\.country)])
      private var parks
  
    var body: some View {
        NavigationStack {
            List(parks) { section in
                Section {
                    ForEach(section) { park in
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
                        }
                        .padding(.vertical, 8)
                    }
                } header: {
                    Text(section.id!)
                }
            }
            .headerProminence(.increased)
            .navigationTitle("Parks")
            .toolbar {
                ToolbarItem {
                        Button {
                            parks.sectionIdentifier = \.region
                            parks.sortDescriptors = [SortDescriptor(\.region)]
                        } label: {
                            Image(systemName: "globe")
                        }
                }
            }
       }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environment(\.managedObjectContext, ParksDataContainer(forPreview: true).persistentContainer.viewContext)
    }
}
