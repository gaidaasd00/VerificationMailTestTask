//
//  MailCollectionViewCell.swift
//  VerificationMailTestTask
//
//  Created by Алексей Гайдуков on 11.10.2022.
//

import Foundation
import UIKit

class MailCollectionViewCell: UICollectionViewCell {
    private let domenLable: UILabel = {
        let lable = UILabel()
        lable.font = UIFont(name: "Apple CD Gothic Neo", size: 16)
        lable.translatesAutoresizingMaskIntoConstraints = false
        
        return lable
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        settupViews()
        setConstrains()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func settupViews() {
        contentView.backgroundColor = .white
        contentView.alpha = 0.5
        contentView.layer.cornerRadius = 10
        
        addSubview(domenLable)
    }
}

extension MailCollectionViewCell {
    private func setConstrains() {
        NSLayoutConstraint.activate([
            domenLable.centerXAnchor.constraint(equalTo: centerXAnchor),
            domenLable.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
}
