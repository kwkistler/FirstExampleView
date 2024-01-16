//
//  FirstExampleViewApp.swift
//  FirstExampleView
//
//  Created by Kraig Kistler on 1/9/24.
//  Copyright © 2024 Kraig Kistler. All rights reserved.
//

import SwiftUI
import SwiftData

@main
struct FirstExampleViewApp: App {
    var body: some Scene {
        WindowGroup {
            FirstExampleView()
                .modelContainer(for: PersonModel.self)
        }
    }
}
