//
//  HomeViewStore.swift
//  MyFriends
//
//  Created by Kristina Korotkova on 11.01.2024.
//

import ComposableArchitecture
import Foundation

@Reducer
struct HomeViewStore {
    struct State: Equatable {
        var friends: IdentifiedArrayOf<Friend> = []
        var path = StackState<DetailViewStore.State>()
    }

    enum Action {
        case addNewFriend(String)
        case deleteFriend(UUID)
        case path(StackAction<DetailViewStore.State, DetailViewStore.Action>)
    }

    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {

            case let .addNewFriend(name):
                state.friends.append(
                    Friend(id: UUID(), name: name, birthday: "", gender: "")
                )
                return .none

            case let .deleteFriend(id):
                state.friends.remove(id: id)
                return .none

            case let .path(.element(id: _, action: .delegate(.saveFriend(friend)))):
                if let row = state.friends.firstIndex(where: { $0.id == friend.id } ) {
                    state.friends[row] = friend
                    print(state.friends)
                }
                return .none

            case .path:
                return .none
            }

        }
        .forEach(\.path, action: \.path) {
            DetailViewStore()
        }
    }
}
