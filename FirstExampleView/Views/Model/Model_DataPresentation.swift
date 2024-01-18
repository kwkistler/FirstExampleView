//
//  Model_DataPresentation.swift
//  FirstExampleView
//
//  Created by Kraig Kistler on 1/17/24.
//  Copyright © 2024 Kraig Kistler. All rights reserved.
//

import SwiftData
import SwiftUI

struct Model_DataPresentation: View {
    @Query private var books: [BookModel]
    
    var body: some View {
        List(books) { book in
            VStack(alignment: .leading, spacing: 12) {
                Image(uiImage: book.viewCover)
                    .resizable()
                    .scaledToFit()
                HStack {
                    Text(book.title)
                        .font(.headline)
                    Spacer()
                    Image(systemName: book.viewAvailability)
                        .foregroundStyle(book.available ? .green : .red)
                }
                LabeledContent("Last Updated",
                               value: book.lastUpdated.formatted(date: .numeric, time: .omitted))
                LabeledContent("Pages", value: "\(book.pages)")
                LabeledContent {
                    Link("Learn More", destination: book.url)
                } label: {
                    Text(book.price, format: .currency(code: "USD"))
                }
                Text(book.bookId.uuidString)
                    .font(.caption2)
            }
            .padding(.vertical)
        }
    }
}

#Preview {
    Model_DataPresentation()
        .modelContainer(BookModel.preview)
}
