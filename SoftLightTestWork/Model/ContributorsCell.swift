//
//  ContributorsCell.swift
//  SoftLightTestWork
//
//  Created by Дмитрий Жучков on 30.03.2021.
//

import Foundation
import SwiftUI
class ContributorsCell: UITableViewCell {
    var AvatarImage: UIImageView = {
           let image = UIImageView()
            image.translatesAutoresizingMaskIntoConstraints = false
            image.tintColor = .green
            return image
        }()
      var idLabel: UILabel = {
          let infoLabel = UILabel()
          infoLabel.translatesAutoresizingMaskIntoConstraints = false
          infoLabel.highlightedTextColor = .white
          infoLabel.textColor = .gray
          infoLabel.font = UIFont.systemFont(ofSize: 17, weight: .bold)
          infoLabel.numberOfLines = 1
          return infoLabel
      }()
      var loginLabel: UILabel = {
          let infoLabel = UILabel()
          infoLabel.translatesAutoresizingMaskIntoConstraints = false
          infoLabel.highlightedTextColor = .white
          infoLabel.textColor = .black
          infoLabel.font = UIFont.systemFont(ofSize: 17, weight: .bold)
          infoLabel.numberOfLines = 1
          return infoLabel
      }()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(AvatarImage)
        AvatarImage.topAnchor.constraint(equalTo:topAnchor).isActive = true
        AvatarImage.leftAnchor.constraint(equalTo:leftAnchor).isActive = true
        AvatarImage.bottomAnchor.constraint(equalTo:bottomAnchor).isActive = true
        AvatarImage.widthAnchor.constraint(equalToConstant: 100).isActive = true
        AvatarImage.heightAnchor.constraint(equalToConstant: 100).isActive = true
        addSubview(loginLabel)
        loginLabel.topAnchor.constraint(equalTo:topAnchor).isActive = true
        loginLabel.leftAnchor.constraint(equalTo: AvatarImage.rightAnchor, constant: 10).isActive = true
        addSubview(idLabel)
        idLabel.topAnchor.constraint(equalTo: loginLabel.bottomAnchor, constant: 3).isActive = true
        idLabel.leftAnchor.constraint(equalTo: AvatarImage.rightAnchor, constant: 10).isActive = true
        idLabel.bottomAnchor.constraint(equalTo:bottomAnchor).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
