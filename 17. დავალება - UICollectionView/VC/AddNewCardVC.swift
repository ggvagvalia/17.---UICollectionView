//
//  AddNewCardVC.swift
//  17. დავალება - UICollectionView
//
//  Created by gvantsa gvagvalia on 4/15/24.
//

import UIKit


class AddNewCardVC: UIViewController {
    
    var addCardClosure: ((ComplaintCard) -> Void)?
    var selectedImage: String?
    
    let backgroundImage: UIImageView = {
        let background = UIImageView()
        background.translatesAutoresizingMaskIntoConstraints = false
        background.image = UIImage(named: "clearBackground")
        return background
    }()
    
    let newCardStackView: UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .vertical
        view.spacing = 10
        view.distribution = .fillProportionally
        view.backgroundColor = .clear
        return view
    }()
    
    let complaintTitleLabel: UILabel = {
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.text = "სათაური"
        title.textColor = .white
        return title
    }()
    
    let complaintTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        let placeholderColor = [NSAttributedString.Key.foregroundColor: UIColor.lightGray]
        textField.attributedPlaceholder = NSAttributedString(string: "მაგ: პანიკა, დახმარება მჭირდება", attributes: placeholderColor)
        textField.borderStyle = .roundedRect
        textField.font = UIFont.boldSystemFont(ofSize: 14)
        textField.backgroundColor = .quaternarySystemFill
        textField.layer.cornerRadius = 8
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.layer.borderWidth = 1.0
        textField.textColor = .white
        return textField
    }()
    
    let complaintDescriptionLabel: UILabel = {
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.text = "აღწერა"
        title.textColor = .white
        return title
    }()
    
    let complaintDescriptionTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        let placeholderColor = [NSAttributedString.Key.foregroundColor: UIColor.lightGray]
        textField.attributedPlaceholder = NSAttributedString(string: "მაგ: ფიგმამ გამიჭედა და ვინმემ გამომიგზავნეთ", attributes: placeholderColor)
        textField.borderStyle = .roundedRect
        textField.font = UIFont.boldSystemFont(ofSize: 14)
        textField.backgroundColor = .quaternarySystemFill
        textField.layer.cornerRadius = 8
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.layer.borderWidth = 1.0
        textField.textColor = .white
        return textField
    }()
    
    let chooseIconLabel: UILabel = {
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.text = "აირჩიეთ აიქონი"
        title.textColor = .white
        return title
    }()
    
    let iconsStackView: UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .horizontal
        view.distribution = .fillProportionally
        view.layer.cornerRadius = 10
        view.heightAnchor.constraint(equalToConstant: 50).isActive = true
        return view
    }()
    
    let redIcon: UIButton = {
        let icon = UIButton()
        icon.translatesAutoresizingMaskIntoConstraints = false
        icon.setImage(UIImage(named: "red"), for: .normal)
        icon.contentMode = .scaleAspectFit
        return icon
    }()
    
    let purpleIcon: UIButton = {
        let icon = UIButton()
        icon.translatesAutoresizingMaskIntoConstraints = false
        icon.setImage(UIImage(named: "purple"), for: .normal)
        icon.contentMode = .scaleAspectFit
        return icon
    }()
    
    let greenIcon: UIButton = {
        let icon = UIButton()
        icon.translatesAutoresizingMaskIntoConstraints = false
        icon.setImage(UIImage(named: "green"), for: .normal)
        icon.contentMode = .scaleAspectFit
        return icon
    }()
    
    let yellowIcon: UIButton = {
        let icon = UIButton()
        icon.translatesAutoresizingMaskIntoConstraints = false
        icon.setImage(UIImage(named: "yellow"), for: .normal)
        icon.contentMode = .scaleAspectFit
        return icon
    }()
    
    let addComplaint: AllButton = {
        let button = AllButton()
        button.setTitle("დამატება", for: .normal)
        button.backgroundColor = .systemGreen
        return button
    }()
    
    // MARK: - <# Section Header #>
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(backgroundImage)
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    func setupUI() {
        addBackgroundImage()
        addStackview()
        addElemensToStackView()
        addButtonTapped()
        addChooseIconView()
    }
    
    func addBackgroundImage() {
        view.addSubview(backgroundImage)
        NSLayoutConstraint.activate([
            backgroundImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImage.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundImage.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    
    func addStackview() {
        view.addSubview(newCardStackView)
        
        NSLayoutConstraint.activate([
            newCardStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            newCardStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 33),
            newCardStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            newCardStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -350),
        ])
    }
    func addElemensToStackView() {
        newCardStackView.addArrangedSubview(complaintTitleLabel)
        newCardStackView.addArrangedSubview(complaintTextField)
        newCardStackView.addArrangedSubview(complaintDescriptionLabel)
        newCardStackView.addArrangedSubview(complaintDescriptionTextField)
        newCardStackView.addArrangedSubview(chooseIconLabel)
        newCardStackView.addArrangedSubview(iconsStackView)
    }
    
    func addChooseIconView() {
        iconsStackView.addArrangedSubview(redIcon)
        iconsStackView.addArrangedSubview(purpleIcon)
        iconsStackView.addArrangedSubview(greenIcon)
        iconsStackView.addArrangedSubview(yellowIcon)
        
        redIcon.addTarget(self, action: #selector(iconButtonTapped(_:)), for: .touchUpInside)
        purpleIcon.addTarget(self, action: #selector(iconButtonTapped(_:)), for: .touchUpInside)
        greenIcon.addTarget(self, action: #selector(iconButtonTapped(_:)), for: .touchUpInside)
        yellowIcon.addTarget(self, action: #selector(iconButtonTapped(_:)), for: .touchUpInside)
    }
    
    @objc private func iconButtonTapped(_ sender: UIButton) {
        
        var chosenIcon: String?
        
        redIcon.isSelected = false
        purpleIcon.isSelected = false
        greenIcon.isSelected = false
        yellowIcon.isSelected = false
        
        switch sender {
        case redIcon:
            chosenIcon = "red"
        case purpleIcon:
            chosenIcon = "purple"
        case greenIcon:
            chosenIcon = "green"
        case yellowIcon:
            chosenIcon = "yellow"
            
        default:
            break
        }
        selectedImage = chosenIcon
    }
    
    private func addButtonTapped() {
        view.addSubview(addComplaint)
        
        addComplaint.addAction(UIAction(handler: { _ in
            self.addNewCard()
        }), for: .touchUpInside)
        
        print(12345)
        
        NSLayoutConstraint.activate([
            addComplaint.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -100),
            addComplaint.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -120),
            addComplaint.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 120),
        ])
    }
    private func addNewCard() {
        guard let complaintTitle = complaintTextField.text,
              let chosenIcon = selectedImage,
              let description = complaintDescriptionTextField.text else {
            return
        }
        let newCard = ComplaintCard(complaintImage: chosenIcon, complaintTitle: complaintTitle, complaintDescription: description)
        addCardClosure?(newCard)
        navigationController?.popViewController(animated: true)
    }
}

//#Preview {
//    AddNewCardVC()
//}
