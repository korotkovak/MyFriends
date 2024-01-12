//
//  CustomTF.swift
//  MyFriends
//
//  Created by Kristina Korotkova on 12.01.2024.
//

import SwiftUI

struct CustomTF: View {

    @Binding var text: String
    @State var image: String
    @State var placeholder: String

    var body: some View {
        HStack {
            Image(systemName: image)
                .foregroundColor(.gray.opacity(0.3))

            TextField(text: $text) {
                Text(placeholder)
                    .foregroundColor(.gray.opacity(0.3))
            }
        }
        .padding(.vertical, 14)
        .padding(.horizontal, 10)
        .background(.gray.opacity(0.09))
        .clipShape(RoundedRectangle(cornerRadius: 8))
        .padding(.horizontal, 20)
    }
}
