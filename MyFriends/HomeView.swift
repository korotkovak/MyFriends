//
//  HomeView.swift
//  MyFriends
//
//  Created by Kristina Korotkova on 11.01.2024.
//

import SwiftUI
import ComposableArchitecture

struct HomeView: View {

    let store: StoreOf<HomeViewStore>

    @State private var friendName: String = ""

    var body: some View {
        NavigationStack {
            WithViewStore(self.store, observe: \.friends) { viewStore in
                VStack {
                    TextField("Friend's name", text: $friendName)
                        .textFieldStyle(.roundedBorder)
                        .padding(20)

                    Button {
                        store.send(.addFriendButtonTapped(friendName))
                    } label: {
                        Text("Add a friend")
                            .fontWeight(.semibold)
                            .padding(.horizontal, 60)
                    }
                    .padding(.vertical, 20)
                    .background(.purple)
                    .foregroundStyle(.white)
                    .clipShape(Capsule())

                    Spacer(minLength: 20)
                    List {
                        ForEach(viewStore.state) { friend in
                            Text(friend.name)
                        }
                    }
                }
                .navigationTitle("MyFriends")
                .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
}

#Preview {
    HomeView(
        store: Store(initialState: HomeViewStore.State()) {
            HomeViewStore()
        }
    )
}
