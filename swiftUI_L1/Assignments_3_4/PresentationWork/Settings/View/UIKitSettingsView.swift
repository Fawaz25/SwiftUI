//
//  UIKitSettingsView.swift
//  swiftUI_L1
//
//  Created by Fawaz Ahmed Tahir on 09/01/2024.
//

import Foundation
import UIKit
import SwiftUI

enum SettingNavigation: Identifiable, Hashable {
    case profileView
    case popToRoot

    var id: SettingNavigation {
        self
    }
}


class Coordinator: NSObject, UINavigationControllerDelegate {
    var parent: UIKitSettingsView

    init(parent: UIKitSettingsView) {
        self.parent = parent
    }

    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        if viewController is UIHostingController<ProfileView> {
            parent.settingNavigationStack.append(.profileView)
        }
    }
}

struct UIKitSettingsView: UIViewControllerRepresentable {
    @Binding var selectedIndex: Int
    @Binding var settingNavigationStack: [SettingNavigation]

    typealias UIViewControllerType = UINavigationController // Embed in a navigation controller

    func makeUIViewController(context: Context) -> UINavigationController {
        let settingsViewController = SettingsViewController(selectedIndex: $selectedIndex, settingNavigationStack: $settingNavigationStack)
        let navigationController = UINavigationController(rootViewController: settingsViewController)
        navigationController.delegate = context.coordinator
        return navigationController
    }

    func updateUIViewController(_ uiViewController: UINavigationController, context: Context) {
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
    }
}
