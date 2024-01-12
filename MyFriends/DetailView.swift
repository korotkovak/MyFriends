//
//  DetailView.swift
//  MyFriends
//
//  Created by Kristina Korotkova on 12.01.2024.
//

import SwiftUI
import ComposableArchitecture

struct DetailView: View {

    let store: StoreOf<DetailViewStore>

    var body: some View {
        WithViewStore(self.store, observe: { $0 }) { viewStore in
            VStack {
                CustomTF(
                    text: viewStore.binding(
                        get: \.friend.name, send: { .setName($0) }
                    ),
                    image: "person.fill",
                    placeholder: "Name"
                )

                CustomTF(
                    text: viewStore.binding(
                        get: \.friend.birthday, send: { .setBirthday($0) }
                    ),
                    image: "person.fill",
                    placeholder: "Birthday"
                )

                CustomTF(
                    text: viewStore.binding(
                        get: \.friend.gender, send: { .setGender($0) }
                    ),
                    image: "person.fill",
                    placeholder: "Gender"
                )
                
                Button("Save") {
                    viewStore.send(.saveButtonTapped)
                }
            }
        }
    }
}

#Preview {
    DetailView(
        store: Store(
            initialState: DetailViewStore.State(
                friend: Friend(id: UUID(), name: "Kristina", birthday: "27.07.1998", gender: "Female")
            )
        ) {
            DetailViewStore()
        }
    )
}
