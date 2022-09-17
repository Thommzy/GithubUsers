//
//  UsersViewController.swift
//  GithubUser
//
//  Created by Timothy Obeisun on 9/13/22.
//

import UIKit

class UsersViewController: UIViewController {
    lazy var userTableView: UITableView = {
        let userTableView = UITableView()
        userTableView.separatorStyle = .none
        userTableView.register(
            UserTableViewCell.self,
            reuseIdentifier: UserTableViewCell.reuseIdentifier
        )
        userTableView.delegate = self
        userTableView.dataSource = self
        return userTableView
    }()
    
    var presenter: UserPresenterProtocol!
    var configurator: UserConfigurationProtocol = UsersConfigurator()
    var sortedFirstLetters: [String] = []
    var userArr: [UserRealm] = []
    var isLoading: Bool = false
    var refreshContol = UIRefreshControl()
    var loader: UIActivityIndicatorView = UIActivityIndicatorView(style: .large)
    let spinner: UIActivityIndicatorView = UIActivityIndicatorView(style: .large)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurator.configure(with: self)
        setupViews()
        presenter.checkRealmDBOnViewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    func setupSpinner() {
        presenter.setupSpinner()
    }
    
    @objc func handleRefresh() {
        presenter.handleRefresh()
    }
}

extension UsersViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userArr.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: UserTableViewCell.reuseIdentifier, for: indexPath) as? UserTableViewCell else { fatalError("failed to deque") }
        cell.configure(item: userArr[indexPath.row])
        return cell
    }
}

extension UsersViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.didTapCell(indexPath: indexPath)
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.section == tableView.numberOfSections - 1 &&
            indexPath.row == tableView.numberOfRows(inSection: indexPath.section) - 1 {
            if isLoading == false {
                presenter.bottomDetected()
            }
        }
    }
}

extension UsersViewController: UserViewControllerProtocol {}

private extension UsersViewController {
    func setupViews() {
        setupSubViews()
        setupSpinner()
    }
    
    func setupSubViews() {
        view.backgroundColor = .white
        title = AppString.homeTitle.localisedValue
        view.addSubview(userTableView)
        userTableView.addSubview(loader)
        setupLoaderView()
        setupUserTableView()
    }
    
    func setupLoaderView() {
        loader.hidesWhenStopped = true
        loader.style = .large
        loader.color = .label
        loader.centerYInSuperview()
        loader.centerXInSuperview()
    }
    
    func setupUserTableView() {
        userTableView.anchor(
            top: view.topAnchor,
            left: view.leftAnchor,
            bottom: view.bottomAnchor,
            right: view.rightAnchor,
            paddingTop: 0,
            paddingLeft: 15,
            paddingBottom: 0,
            paddingRight: 0
        )
    }
}
