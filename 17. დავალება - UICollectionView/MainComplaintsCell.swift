//
//  MainComplaintsCell.swift
//  17. დავალება - UICollectionView
//
//  Created by gvantsa gvagvalia on 4/14/24.
//

import UIKit

class MainComplaintsCell: UICollectionViewCell {
    
    let complaintStackView: UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .vertical
        view.distribution = .fillProportionally
        view.alignment = .leading
        view.backgroundColor = .quaternarySystemFill
        view.layer.cornerRadius = 15
        return view
    }()
    
    let iconImage: UIImageView = {
        let icon = UIImageView()
        icon.translatesAutoresizingMaskIntoConstraints = false
        icon.image = UIImage(named: "red")
        icon.layer.cornerRadius = 15
        icon.contentMode = .scaleAspectFit
        icon.clipsToBounds = true
        return icon
    }()
    
    let complaintNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
//        label.text = "Beka ras gverchi?"
        label.font = UIFont.systemFont(ofSize: 22)
        label.numberOfLines = 0
        label.textColor = .white
        return label
    }()
    
    let complaintDescriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
//        label.text = "ახლა გავხსენი დავალება ეს რააარიიი"
        label.font = UIFont.systemFont(ofSize: 14)
        label.numberOfLines = 0
        label.textColor = .gray
        return label
    }()
    
    
    // MARK: - LifeCycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        setupView()
        setupStackView()
        
    }
    
    func setupView() {
        addSubview(complaintStackView)

        NSLayoutConstraint.activate([
            complaintStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            complaintStackView.topAnchor.constraint(equalTo: topAnchor),
            complaintStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            complaintStackView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
    func setupStackView() {
        complaintStackView.addArrangedSubview(iconImage)
        complaintStackView.addArrangedSubview(complaintNameLabel)
        complaintStackView.addArrangedSubview(complaintDescriptionLabel)
        
        
    }
}
