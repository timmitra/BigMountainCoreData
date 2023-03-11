//
//  BigMountainCoreDataApp.swift
//  BigMountainCoreData
//
//  Created by Tim Mitra on 2023-02-15.
//

import SwiftUI

@main
struct BigMountainCoreDataApp: App {
    var body: some Scene {
        WindowGroup {
          PreviewingData_Intro()
            .environment(\.managedObjectContext, FriendsContainer().persistentContainer.viewContext)
        }
    }
}
