//
//  OnboardingVC.swift
//  17. დავალება - UICollectionView
//
//  Created by gvantsa gvagvalia on 4/14/24.
//

import UIKit

class OnboardingVC: UIViewController {
    
    let backgroundImage: UIImageView = {
        let background = UIImageView()
        background.translatesAutoresizingMaskIntoConstraints = false
        background.image = UIImage(named: "background")
        background.contentMode = .scaleAspectFill
        return background
    }()
    
    let textLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "შედი აპლიკაციაში და იწუწუნე რამდენიც გინდა"
        label.font = UIFont.systemFont(ofSize: 35)
        label.textColor = .white
        label.numberOfLines = 0
        label.textAlignment = .left
        return label
    }()
    
    let startButton: AllButton = {
        let button = AllButton()
        button.setTitle("დაწყება", for: .normal)
        return button
    }()
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(backgroundImage)
        addLabel()
        addButton()
        NSLayoutConstraint.activate([
            backgroundImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: -15),
            backgroundImage.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 15),
            backgroundImage.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    
    func goToMainPage() {
        let vc = MainPageVC()
        navigationController?.pushViewController(vc, animated: true)
    }
    func addLabel() {
        view.addSubview(textLabel)
        NSLayoutConstraint.activate([
            textLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 21),
            textLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 330),
            textLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -120),
        ])
    }
    
    func addButton() {
        view.addSubview(startButton)
        
        startButton.addAction(UIAction(handler: { _ in
            self.goToMainPage()
        }), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            startButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -80),
            startButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            startButton.widthAnchor.constraint(equalToConstant: 125)
        ])
    }
}

//#Preview {
//    OnboardingVC()
//}
