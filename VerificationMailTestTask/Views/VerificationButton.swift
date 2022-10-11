//
//  VerificationButton.swift
//  VerificationMailTestTask
//
//  Created by Алексей Гайдуков on 11.10.2022.
//

import Foundation
import UIKit

class VerificationButton: UIButton  {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
     }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        backgroundColor = .white
        setTitle("Verification Button", for: .normal)
        setTitleColor(.black, for: .normal)
        layer.cornerRadius = 10
        titleLabel?.font = UIFont(name: "Avenir Book", size: 17)
        isEnabled = false
        alpha = 0.5
        translatesAutoresizingMaskIntoConstraints = false
    }
}
