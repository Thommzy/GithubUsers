//
//  UserTableViewCell.swift
//  GithubUser
//
//  Created by Timothy Obeisun on 9/14/22.
//

import UIKit

final class UserTableViewCell: UITableViewCell {
    
    lazy var baseView: UIView = {
        let baseView = UIView()
        return baseView
    }()
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView(
            arrangedSubviews:[
                leftView,
                middleView
            ])
        stackView.distribution = .fill
        return stackView
    }()
    
    lazy var leftView: UIView = {
        let leftView = UIView()
        leftView.backgroundColor = .clear
        return leftView
    }()
    
    lazy var userImageView: UIImageView = {
        let userImageView = UIImageView()
        let image = UIImage(
            systemName: "person.crop.circle",
            withConfiguration:UIImage.SymbolConfiguration(
                weight: .bold
            ))?.withTintColor(
                .systemGray,
                renderingMode: .alwaysOriginal
            )
        userImageView.image = image
        return userImageView
    }()
    
    lazy var middleView: UIView = {
        let middleView = UIView()
        middleView.backgroundColor = .clear
        return middleView
    }()
    
    lazy var nameLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.font = UIFont.boldSystemFont(ofSize: 17.0)
        nameLabel.numberOfLines = 0
        return nameLabel
    }()
    
    func configure(item: UserRealm?) {
        if let item = item {
            nameLabel.text = item.login
            let url = URL(string: item.avatarURL ?? "")!
            ImageManager().loadImage(for: url) { [weak self] result in
                switch result {
                case .success(let image):
                    self?.userImageView.image = image
                case .failure(_):
                    break
                }
            }
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.userImageView.image = nil
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        setupViews()
    }
    
    private func setupViews() {
        setupSubViews()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension UserTableViewCell {
    func setupSubViews() {
        contentView.addSubview(baseView)
        baseView.addSubview(
            [
                stackView
            ]
        )
        leftView.addSubview(userImageView)
        middleView.addSubview(nameLabel)
        setupBaseView()
        setupStackView()
        setupLeftView()
        setupUserImageView()
        setupNameLabel()
    }
    
    func setupNameLabel() {
        nameLabel.anchor(
            left: middleView.leftAnchor,
            paddingLeft: 5
        )
        nameLabel.centerYInSuperview()
    }
    
    func setupUserImageView() {
        userImageView.constrainSize(width: 70, height: 70)
        userImageView.centerXInSuperview()
        userImageView.centerYInSuperview()
        userImageView.layer.cornerRadius = userImageView.bounds.width / 2
        userImageView.layer.masksToBounds = true
    }
    
    func setupLeftView() {
        leftView.constrainWidth(100)
    }
    
    func setupStackView() {
        stackView.backgroundColor = .clear
        stackView.anchor(
            top: topAnchor,
            left: leftAnchor,
            bottom: bottomAnchor,
            right: rightAnchor
        )
    }
    
    func setupBaseView() {
        baseView.backgroundColor = .clear
        baseView.layer.cornerRadius = 10
        baseView.layer.masksToBounds = true
        baseView.anchor(
            top: topAnchor,
            left: leftAnchor,
            bottom: bottomAnchor,
            right: rightAnchor,
            paddingTop: 5,
            paddingRight: 5
        )
    }
}
