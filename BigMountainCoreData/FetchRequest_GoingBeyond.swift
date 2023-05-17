// Copyright © 2022 Big Mountain Studio. All rights reserved. Twitter: @BigMtnStudio

import SwiftUI
import CoreData

/*
 This let's you limit the fetch to 5
 */

extension ParkEntity {
    /* BOOK NOTE
     We're using an NSFetchRequest here.
     */
    static var firstFive: NSFetchRequest<ParkEntity> {
        let request = ParkEntity.fetchRequest()
        
        request.sortDescriptors = [NSSortDescriptor(keyPath: \ParkEntity.name, ascending: true)]
        
        request.fetchLimit = 5
        
        return request
    }
}

struct FetchRequest_GoingBeyond: View {
    /* BOOK NOTE
     Notice you don't have to specify the type here with <ParkEntity> since ParkEntity.firstFive specifies it.
     */
    @FetchRequest(fetchRequest: ParkEntity.firstFive)
    private var parks
    
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
            .safeAreaInset(edge: .bottom) {
                VStack {
                    Divider()
                    Text("Total Parks: \(parks.count)")
                }
                .background(.bar)
            }
            .navigationTitle("Parks")
        }
    }
}

struct FetchRequest_GoingBeyond_Previews: PreviewProvider {
    static var previews: some View {
        FetchRequest_GoingBeyond()
            .environment(\.managedObjectContext, ParksDataContainer(forPreview: true).persistentContainer.viewContext)
    }
}
