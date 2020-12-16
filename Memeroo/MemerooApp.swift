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
			MainView()
				.environmentObject(ViewRouter())
				.environmentObject(Meme())
//			FocusedImageViewer(image: Image("TestImage"))
			
//            ContentView()
//                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
