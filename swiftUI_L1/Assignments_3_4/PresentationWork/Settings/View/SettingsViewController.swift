//
//  SettingsViewController.swift
//  swiftUI_L1
//
//  Created by Fawaz Ahmed Tahir on 08/01/2024.
//

import UIKit
import SwiftUI


class SettingsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @Binding var selectedIndex: Int
    @Binding var settingNavigationStack: [SettingNavigation]

    var tableView = UITableView()

    init(selectedIndex: Binding<Int>, settingNavigationStack: Binding<[SettingNavigation]>) {
        self._selectedIndex = selectedIndex
        self._settingNavigationStack = settingNavigationStack
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }

    func setupTableView() {
        tableView = UITableView(frame: view.bounds, style: .plain)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.dataSource = self
        tableView.delegate = self
        view.addSubview(tableView)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return SettingsOptions.allCases.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = SettingsOptions.allCases[indexPath.row].displayName()
        cell.accessoryType = .disclosureIndicator
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedOption = SettingsOptions.allCases[indexPath.row]

        switch selectedOption {
        case .View_Profile:
            navigateToViewProfile()
        case .Student_Listing_Tab:
            switchToTab1Root()
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }

    func navigateToViewProfile() {
            if let navigationController = navigationController {
                let profileView = UIHostingController(rootView: ProfileView())
                profileView.navigationItem.title = "Profile"
                navigationController.pushViewController(profileView, animated: true)
            }
        }

        func switchToTab1Root() {
            selectedIndex = 0
            settingNavigationStack = [.popToRoot]
        }
}
