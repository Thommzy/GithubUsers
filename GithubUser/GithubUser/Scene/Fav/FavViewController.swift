//
//  FavViewController.swift
//  GithubUser
//
//  Created by Timothy Obeisun on 9/17/22.
//

import UIKit

class FavViewController: UIViewController {
    lazy var favTableView: UITableView = {
        let favTableView = UITableView()
        favTableView.separatorStyle = .none
        favTableView.register(
            UserTableViewCell.self,
            reuseIdentifier: UserTableViewCell.reuseIdentifier
        )
        favTableView.delegate = self
        favTableView.dataSource = self
        return favTableView
    }()
    
    var userArr: [UserRealm] = []
    var presenter: FavPresenterProtocol!
    var configurator: FavConfigurationProtocol = FavConfigurator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurator.configure(with: self)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setupViews()
        presenter.triggerFavData()
    }
}

extension FavViewController {
    func setupViews() {
        view.backgroundColor = .white
        setupSubViews()
    }
    
    func setupSubViews() {
        view.addSubview(
            [
                favTableView
            ]
        )
        setupFavTableView()
    }
    
    func setupFavTableView() {
        favTableView.anchor(
            top: view.safeAreaLayoutGuide.topAnchor,
            left: view.leftAnchor,
            bottom: view.bottomAnchor,
            right: view.rightAnchor,
            paddingTop: 0,
            paddingLeft: 0,
            paddingBottom: 0,
            paddingRight: 0
        )
    }
}

extension FavViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.didTapCell(indexPath: indexPath)
    }
}

extension FavViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: UserTableViewCell.reuseIdentifier, for: indexPath) as? UserTableViewCell else { fatalError("failed to deque") }
        cell.configure(item: userArr[indexPath.row])
        return cell
    }
}


extension FavViewController: FavViewControllerProtocol {}
