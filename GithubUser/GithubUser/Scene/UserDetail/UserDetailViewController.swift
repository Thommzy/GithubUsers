//
//  UserDetailViewController.swift
//  GithubUser
//
//  Created by Timothy Obeisun on 9/17/22.
//

import UIKit
import RealmSwift

class UserDetailViewController: UIViewController {
    
    lazy var userImageView: UIImageView = {
        let userImageView = UIImageView()
        userImageView.contentMode = .scaleAspectFit
        return userImageView
    }()
    
    lazy var idLabel: UILabel = {
        let idLabel = UILabel()
        idLabel.numberOfLines = 0
        idLabel.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        return idLabel
    }()
    
    var item: UserRealm?
    var isfavourited: Bool?
    
    var presenter: UserDetailPresenterProtocol!
    var configurator: UserDetailConfiguratorProtocol = UserDetailConfigurator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurator.configure(with: self)
        isfavourited = item?.isfavourited
        setupViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setupViews()
    }
}

extension UserDetailViewController {
    func setupViews() {
        view.backgroundColor = .white
        setupSubViews()
    }
    
    func setupSubViews() {
        view.addSubview(
            [
                userImageView,
                idLabel
            ]
        )
        setupCustomBackButton()
        setupFavIcon()
        setupUserImageView()
        setupIdLabel()
    }
    
    func setupIdLabel() {
        idLabel.text = "userId: \(item?.id ?? 0)"
        idLabel.anchor(
            top: userImageView.bottomAnchor,
            left: view.leftAnchor,
            right: view.rightAnchor,
            paddingTop: 10,
            paddingLeft: 15,
            paddingRight: 15
        )
    }
    
    func setupUserImageView() {
        let url = URL(string: item?.avatarURL ?? "")!
        ImageManager.init().loadImage(for: url) { [weak self] result in
            switch result {
            case .success(let image):
                self?.userImageView.image = image
            case .failure(_):
                break
            }
        }
        userImageView.anchor(
            top: view.safeAreaLayoutGuide.topAnchor,
            left: view.leftAnchor,
            right: view.rightAnchor,
            paddingTop: 0,
            paddingLeft: 0,
            paddingRight: 0,
            height: 400
        )
    }
    
    func setupFavIcon() {
        let button = UIButton()
        let image = UIImage(
            systemName: AppString.notbookmarked.localisedValue,
            withConfiguration:UIImage.SymbolConfiguration(weight: .heavy))?.withTintColor(
                .label,
                renderingMode: .alwaysOriginal
            )
        let selectedImage = UIImage(
            systemName: AppString.bookmarked.localisedValue,
            withConfiguration:UIImage.SymbolConfiguration(
                weight: .heavy)
        )?.withTintColor(
            .label,
            renderingMode: .alwaysOriginal
        )
        if let isfavourited  = self.isfavourited {
            button.setImage(
                isfavourited
                ? selectedImage
                : image,
                for: .normal
            )
            button.setImage(
                !isfavourited
                ? selectedImage
                : image, for: .selected
            )
        }
        
        button.addTarget(self, action: #selector(rightNavBarItemAction), for: .touchUpInside)
        let barButton = UIBarButtonItem()
        barButton.customView = button
        self.navigationItem.rightBarButtonItem = barButton
    }
    
    @objc func rightNavBarItemAction(sender: UIButton) {
        sender.isSelected = !sender.isSelected
        if sender.isSelected == false && self.isfavourited == true {
            presenter.didDeSelectBookMark(isFaved: false)
            self.isfavourited = false
        } else if sender.isSelected == true && self.isfavourited == true {
            presenter.didDeSelectBookMark(isFaved: false)
            self.isfavourited = false
        } else if sender.isSelected == true && self.isfavourited == false {
            presenter.didSelectBookMark(isFaved: true)
            self.isfavourited = true
        }  else if sender.isSelected == false && self.isfavourited == false {
            presenter.didSelectBookMark(isFaved: true)
            self.isfavourited = true
        }
    }
    
    func setupCustomBackButton() {
        let backButton = UIBarButtonItem()
        backButton.title = item?.login
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
        self.navigationController?.navigationBar.tintColor = .black
    }
}

extension UserDetailViewController: UserDetailViewControllerProtocol {}
