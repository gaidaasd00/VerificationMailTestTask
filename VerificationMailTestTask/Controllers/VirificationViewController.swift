//
//  ViewController.swift
//  VerificationMailTestTask
//
//  Created by Алексей Гайдуков on 11.10.2022.
//

import UIKit

class VirificationViewController: UIViewController {
    
//MARK: - Private method
    private let backgroundImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.image = UIImage(named: "background")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let statusLable = StatusLable()
    private let mailTextField = MailTextField()
    private let verificationButton = VerificationButton()
    private let mailsCollectionView = MailsCollectionView(
        frame: .zero,
        collectionViewLayout: UICollectionViewLayout()
    )
    private let collectionView = MailsCollectionView()
    private lazy var stackView = UIStackView(
        arrangeSubViews: [mailTextField, verificationButton, collectionView],
        axis: .vertical,
        spacing: 20
    )

//MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setDelegates()
        setConstreins()
    }

//MARK: - Private Func
    private func setupViews() {
        view.addSubview(backgroundImageView)
        view.addSubview(statusLable)
        view.addSubview(stackView)
        verificationButton.addTarget(
            self,
            action: #selector(verificationButtonTapped),
            for: .touchUpInside
        )
    }
    
// objc
    @objc private func verificationButtonTapped() {
        print("ButtonTapped")
    }
    
    private func setDelegates() {
        collectionView.dataSource = self
        collectionView.selectMailDelegate = self
        mailTextField.textFieldDelegate = self
    }
}

//MARK: - SelectMailProtocol
extension VirificationViewController: SelectMailProtocol {
    func selectMail(indexPath: IndexPath) {
        print(indexPath)
    }
}

//MARK: -
extension VirificationViewController: TypingMailTextFieldProtocol {
    func typingText(text: String) {
        print(text)
    }
    
    func cleanOutTF() {
        print("Clear")
    }
}

//MARK: - UICollectionViewDataSource
extension VirificationViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: IdCell.idMailCell.rawValue,
            for: indexPath)
                as? MailCollectionViewCell else { return UICollectionViewCell() }
        return cell
    }
    
    
}

//MARK: - setConstreins
extension VirificationViewController {
    private func setConstreins() {
        NSLayoutConstraint.activate([
            backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            backgroundImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            statusLable.topAnchor.constraint(equalTo: view.topAnchor, constant: 300),
            statusLable.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            statusLable.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
        
        NSLayoutConstraint.activate([
            mailTextField.heightAnchor.constraint(equalToConstant: 50),
            stackView.topAnchor.constraint(equalTo: statusLable.bottomAnchor,constant: 2),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
        ])
        
    }
}
