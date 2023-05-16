//
//  ContentView.swift
//  BigMountainCoreData
//
//  Created by Tim Mitra on 2023-02-15.
//

import SwiftUI

struct ContentView: View {
    
    @State private var justCanada = false
  
  // shorter version of FetchedResults
    @FetchRequest<ParkEntity>(sortDescriptors: [])
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
            .navigationTitle("Parks")
            .toolbar {
                ToolbarItem {
                    Button {
                        justCanada.toggle()
                        parks.nsPredicate = justCanada ? NSPredicate(format: "country == 'Canada'") : nil
                    } label: {
                        Image(systemName: justCanada ? "globe.americas.fill" : "globe.americas.fill.fill")
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
