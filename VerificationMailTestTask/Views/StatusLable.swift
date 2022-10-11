//
//  StatusLable.swift
//  VerificationMailTestTask
//
//  Created by Алексей Гайдуков on 11.10.2022.
//

import Foundation
import UIKit

class StatusLable: UILabel {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func configure() {
        text = "Check your mail"
        textColor = .cyan
        font = UIFont(name: "Apple CD Gothic Neo", size: 16)
        adjustsFontSizeToFitWidth = true
        translatesAutoresizingMaskIntoConstraints = false
    }
}
