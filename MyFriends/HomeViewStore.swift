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
    }

    enum Action {
        case addFriendButtonTapped(String)
    }

    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {

            case let .addFriendButtonTapped(name):
                state.friends.append(
                    Friend(id: UUID(), name: name)
                )
                return .none
            }
        }
    }
}
