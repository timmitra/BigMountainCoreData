//
//  PreviewingData_Intro.swift
//  BigMountainCoreData
//
//  Created by Tim Mitra on 2023-03-11.
//

import SwiftUI

struct PreviewingData_Intro: View {
  
  @FetchRequest(sortDescriptors: []) var friends: FetchedResults<FriendsEntity>
  
    var body: some View {
      List(friends) { friend in
        Text(friend.firstName ?? "")
      }
      .font(.title)
    }
}

struct PreviewingData_Intro_Previews: PreviewProvider {
    static var previews: some View {
        PreviewingData_Intro()
        .environment(\.managedObjectContext, FriendsContainer(forPreview: true).persistentContainer.viewContext)
    }
}
