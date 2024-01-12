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

    @State private var name: String = ""

    var body: some View {
        NavigationStackStore(self.store.scope(state: \.path, action: \.path)) {
            WithViewStore(self.store, observe: { $0 }) { viewStore in
                VStack {
                    CustomTF(
                        text: $name,
                        image: "person.fill",
                        placeholder: "Friend's name"
                    )

                    Button {
                        store.send(.addNewFriend(name))
                    } label: {
                        Text("Add a friend")
                            .frame(maxWidth: .infinity)
                            .fontWeight(.semibold)
                    }
                    .padding(.horizontal, 20)
                    .padding(.vertical, 12)
                    .buttonStyle(.borderedProminent)
                    .tint(.green)
                    .controlSize(.large)

                    Spacer(minLength: 20)

                    List {
                        ForEach(viewStore.state.friends) { friend in
                            NavigationLink(state: DetailViewStore.State(friend: friend)) {
                                Text(friend.name)
                            }
                            .buttonStyle(.borderless)
                            .swipeActions {
                                Button("Delete") {
                                    viewStore.send(.deleteFriend(friend.id))
                                }
                                .tint(.red)
                            }
                        }
                    }
                }
                .navigationTitle("MyFriends")
                .navigationBarTitleDisplayMode(.inline)
            }
        } destination: { store in
            DetailView(store: store)
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
