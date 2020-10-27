//
//  MemerooApp.swift
//  Memeroo
//
//  Created by Josh Jaslow on 10/9/20.
//

import SwiftUI

@main
struct MemerooApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
			MemerooTabBar()
				.environmentObject(ViewRouter())
				.environmentObject(Meme())
			
//            ContentView()
//                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
