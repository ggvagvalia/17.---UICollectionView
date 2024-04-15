//
//  Card.swift
//  17. დავალება - UICollectionView
//
//  Created by gvantsa gvagvalia on 4/15/24.
//

import UIKit


class ComplaintCard {
    let complaintImage: String
    let complaintTitle: String
    let complaintDescription: String
    
    init(complaintImage: String, complaintTitle: String, complaintDescription: String) {
        self.complaintImage = complaintImage
        self.complaintTitle = complaintTitle
        self.complaintDescription = complaintDescription
    }
}

var complaintsArray: [ComplaintCard] = [
    ComplaintCard(complaintImage: "red", complaintTitle: "Beka ras gverchi?", complaintDescription: "ახლა გავხსენი დავალება ეს რააარიიი"),
    ComplaintCard(complaintImage: "purple", complaintTitle: "რამე სიმღერა მირჩიეთ", complaintDescription: "დავალების კეთებისას ღამე ძაან მეძინება, ყავამ არ მიშველა"),
    ComplaintCard(complaintImage: "green", complaintTitle: "ფიგმამ თქვენც დაგტანჯათ?", complaintDescription: "შევწუცდი დაბალი ხარისხით იწერს ყველას"),
    ComplaintCard(complaintImage: "yellow", complaintTitle: "მეტი ბედინა გვინდა", complaintDescription: "შევწუხდით ნუ, აღარ გვინდა ამდენი ტეილორ Swift-ი"),
]
