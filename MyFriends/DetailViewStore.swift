//
//  DetailViewStore.swift
//  MyFriends
//
//  Created by Kristina Korotkova on 12.01.2024.
//

import ComposableArchitecture
import Foundation

@Reducer
struct DetailViewStore {
    struct State: Equatable {
        var friend: Friend
    }

    enum Action {
        case saveButtonTapped
        case delegate(Delegate)
        case setName(String)
        case setBirthday(String)
        case setGender(String)

        enum Delegate: Equatable {
            case saveFriend(Friend)
        }
    }

    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .saveButtonTapped:
                print(state.friend)
                return .send(.delegate(.saveFriend(state.friend)))
            case let .setName(name):
                state.friend.name = name
                return .none
            case let .setBirthday(birthday):
                state.friend.birthday = birthday
                return .none
            case let .setGender(gender):
                state.friend.gender = gender
                return .none
            case .delegate:
                return .none
            }
        }
    }
}
