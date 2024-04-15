//
//  MainPageVC.swift
//  17. დავალება - UICollectionView
//
//  Created by gvantsa gvagvalia on 4/14/24.
//

import UIKit

class MainPageVC: UIViewController {
    
    var cards: [ComplaintCard] = []
    
    let backgroundImage: UIImageView = {
        let background = UIImageView()
        background.translatesAutoresizingMaskIntoConstraints = false
        background.image = UIImage(named: "clearBackground")
        return background
    }()
    
    let complaintsCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        var view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemGroupedBackground
        view.backgroundColor = .clear
        return view
    }()
    
    let addComplaintButton: AllButton = {
        let button = AllButton()
        button.setTitle("ახალი წუწუნ ბარათის დამატება", for: .normal)
        return button
    }()
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = true
        setupUI()
        
    }
    
    func setupUI() {
        addBackgroundImage()
        setupCollectionView()
        addButton()
    }
    
    func addBackgroundImage() {
        view.addSubview(backgroundImage)
        
        backgroundImage.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        backgroundImage.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        backgroundImage.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        backgroundImage.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    func setupCollectionView() {
        complaintsCollectionView.delegate = self
        complaintsCollectionView.dataSource = self
        view.addSubview(complaintsCollectionView)
        
        NSLayoutConstraint.activate([
            complaintsCollectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            complaintsCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            complaintsCollectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            complaintsCollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -287),
        ])
        complaintsCollectionView.register(MainComplaintsCell.self, forCellWithReuseIdentifier: "MainComplaintsCell")
    }
    
    func addButton() {
        view.addSubview(addComplaintButton)
        addComplaintButton.addAction(UIAction(handler: { _ in
            self.goToAddDetailPage()
        }), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            addComplaintButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -100),
            addComplaintButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -42),
            addComplaintButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 42),
        ])
    }
    private func goToAddDetailPage() {
        let vc = AddNewCardVC()
        vc.addCardClosure = { [weak self] newCard in
            print("added")
            complaintsArray.append(newCard)
            self?.complaintsCollectionView.reloadData()
            print("roloaded")
        }
        navigationController?.pushViewController(vc, animated: true)
        //    present(vc, animated: true, completion: nil)
    }
}

extension MainPageVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        complaintsArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let mainCell = collectionView.dequeueReusableCell(withReuseIdentifier: "MainComplaintsCell", for: indexPath) as! MainComplaintsCell
        let card = complaintsArray[indexPath.row]
        mainCell.iconImage.image = UIImage(named: card.complaintImage)
        mainCell.complaintNameLabel.text = card.complaintTitle
        mainCell.complaintDescriptionLabel.text = card.complaintDescription
        return mainCell
    }
}

extension MainPageVC: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        print("... \(indexPath.row)")
    }
    
}

extension MainPageVC: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(
            width: (view.frame.size.width / 2.37),
            height: (view.frame.size.width / 1.8)
        )
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 16
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 16
    }
}

//#Preview {
//    MainPageVC()
//}
