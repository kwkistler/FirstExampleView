//
//  BookModel.swift
//  FirstExampleView
//
//  Created by Kraig Kistler on 1/16/24.
//  Copyright © 2024 Kraig Kistler. All rights reserved.
//

import Foundation
import SwiftData
import UIKit

@Model
class BookModel {
    var bookId: UUID
    var title: String
    var price: Decimal
    var available: Bool
    var pages: Int
    var url: URL
    var lastUpdated = Date() // leave lastUpdated out of the init because it has a defualt value
    var cover: Data?
    
    // cover: Data? = nil - The cover property will be used to store images for the book cover.
    // This property is optional. In the init, this property is defaulted to nil, meaning it is not required when call the init.
    // The cover image is optional (cover: Data? = nil) so first we make sure it has a value before converting the data to a UIImage. If cover is nill or the conversion fails, an SF Symbol is returned by the extension below.
    init(bookId: UUID, title: String, price: Decimal, available: Bool, pages: Int, url: URL, cover: Data? = nil) {
        self.bookId = bookId
        self.title = title
        self.price = price
        self.available = available
        self.pages = pages
        self.url = url
        self.cover = cover
    }
}

extension BookModel {
    var viewAvailability: String {
        available ? "checkmark" : "xmark" // Show ✔️ or X for availability so I'm returning the SF Symbol name base on the value
    }
    
    var viewCover: UIImage {
        if let data = cover, let image = UIImage(data: data) {
            return image
        } else {
            return UIImage(systemName: "note.text")! // SF Symbol
        }
    }
}

extension BookModel {
    @MainActor
    static var preview: ModelContainer {
        let container = try! ModelContainer(for: BookModel.self,
                                            configurations: ModelConfiguration(isStoredInMemoryOnly: true))
        container.mainContext.insert(
            BookModel(
                bookId: UUID(),
                title: "Working with Data in SwiftUI",
                price: 34.00,
                available: true,
                pages: 179,
                url: URL(string: "https://www.bigmountainstudio.com/data")!,
                cover: UIImage(resource: .workingWithDataInSwiftui).pngData()!
            )
        )
        
        container.mainContext.insert(
            BookModel(
                bookId: UUID(),
                title: "SwiftUI Views Mastery",
                price: 55.00,
                available: true,
                pages: 1042,
                url: URL(string: "https://www.bigmountainstudio.com/views")!,
                cover: UIImage(resource: .swiftuiViewsMastery).pngData()!
            )
        )
        
        container.mainContext.insert(
            BookModel(
                bookId: UUID(),
                title: "SwiftUI Animations Mastery",
                price: 55.00,
                available: true,
                pages: 474,
                url: URL(string: "https://www.bigmountainstudio.com/animations")!,
                cover: UIImage(resource: .swiftuiAnimationsMastery).pngData()!
            )
        )
        
        container.mainContext.insert(
            BookModel(
                bookId: UUID(),
                title: "SwiftData Mastery in SwiftUI",
                price: 97.00,
                available: true,
                pages: 520,
                url: URL(string: "https://www.bigmountainstudio.com/swiftdata")!,
                cover: UIImage(resource: .swiftdataMastery).pngData()!
            )
        )
        
        container.mainContext.insert(
            BookModel(
                bookId: UUID(),
                title: "Core Data Mastery in SwiftUI",
                price: 97.00,
                available: true,
                pages: 551,
                url: URL(string: "https://www.bigmountainstudio.com/coredata")!,
                cover: UIImage(resource: .coreDataMasteryInSwiftui).pngData()!
            )
        )
        
        container.mainContext.insert(
            BookModel(
                bookId: UUID(),
                title: "Combine Mastery in SwiftUI",
                price: 147.00,
                available: true,
                pages: 435,
                url: URL(string: "https://www.bigmountainstudio.com/combine")!,
                cover: UIImage(resource: .combineInSwiftui).pngData()!
            )
        )
        
        return container
    }
}
