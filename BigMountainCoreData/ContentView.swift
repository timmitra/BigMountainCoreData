//
//  ContentView.swift
//  BigMountainCoreData
//
//  Created by Tim Mitra on 2023-02-15.
//

import SwiftUI

struct ContentView: View {
  
    @State private var sortAscending = true
  // shorter version of FetchedResults
    @FetchRequest<ParkEntity>(sortDescriptors: [
        SortDescriptor(\.name)
    ]) private var parks
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
            .navigationTitle("Parks")
            .toolbar {
                ToolbarItem {
                    Button {
                        sortAscending.toggle()
                        parks.sortDescriptors = [SortDescriptor(\.name, order: sortAscending ? .forward : .reverse)]
                    } label: {
                        Image(systemName: sortAscending ? "line.3.horizontal.decrease.circle" : "line.3.horizontal.decrease.circle.fill")
                    }
                }
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
