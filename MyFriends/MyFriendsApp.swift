//
//  MyFriendsApp.swift
//  MyFriends
//
//  Created by Kristina Korotkova on 11.01.2024.
//

import SwiftUI
import ComposableArchitecture

@main
struct MyFriendsApp: App {
    var body: some Scene {
        WindowGroup {
            HomeView(
                store: Store(initialState: HomeViewStore.State()) {
                    HomeViewStore()
                }
            )
        }
    }
}
