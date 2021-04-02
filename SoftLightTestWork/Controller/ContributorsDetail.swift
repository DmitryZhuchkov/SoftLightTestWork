//
//  ContributorsDetail.swift
//  SoftLightTestWork
//
//  Created by Дмитрий Жучков on 30.03.2021.
//

import Foundation
import UIKit
class ContributorsDetail: UIViewController {
    var AvatarImage: UIImageView = {
           let image = UIImageView()
            image.translatesAutoresizingMaskIntoConstraints = false
            image.tintColor = .green
            return image
        }()
    var loginLabel: UILabel = {
        let infoLabel = UILabel()
        infoLabel.translatesAutoresizingMaskIntoConstraints = false
        infoLabel.highlightedTextColor = .white
        infoLabel.textColor = .black
        infoLabel.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        infoLabel.numberOfLines = 1
        return infoLabel
    }()
    override func viewDidLoad() {
           super.viewDidLoad()
        view.addSubview(AvatarImage)
        AvatarImage.heightAnchor.constraint(equalToConstant: 250).isActive = true
        AvatarImage.widthAnchor.constraint(equalToConstant: 250).isActive = true
        AvatarImage.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        AvatarImage.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        view.addSubview(loginLabel)
        loginLabel.topAnchor.constraint(equalTo: AvatarImage.bottomAnchor, constant: 50).isActive = true
        loginLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
    }
}
