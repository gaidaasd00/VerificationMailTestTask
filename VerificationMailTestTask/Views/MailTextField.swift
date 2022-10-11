//
//  MailTextField.swift
//  VerificationMailTestTask
//
//  Created by Алексей Гайдуков on 11.10.2022.
//

import Foundation
import UIKit

protocol TypingMailTextFieldProtocol: AnyObject {
    func typingText(text: String)
    func cleanOutTF()
}

class MailTextField: UITextField {
    weak var textFieldDelegate: TypingMailTextFieldProtocol?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
        delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func configure() {
        backgroundColor = .white
        borderStyle = .none
        layer.cornerRadius = 10
        textColor = .black
        leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: frame.height))
        leftViewMode = .always
        clearButtonMode = .always
        returnKeyType = .done
        placeholder = "Enter your mail"
        font = UIFont(name: "Apple CD Gothic Neo", size: 20)
        tintColor =  .gray
        translatesAutoresizingMaskIntoConstraints = false
    }
}

extension MailTextField: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.resignFirstResponder()
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let text = textField.text else { return true }
        textFieldDelegate?.typingText(text: text)
        return true
    }
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        textFieldDelegate?.cleanOutTF()
        return true
    }
}
