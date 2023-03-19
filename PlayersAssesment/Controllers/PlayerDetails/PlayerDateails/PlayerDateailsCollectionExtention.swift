//
//  CollectionExtention.swift
//  PlayersAssesment
//
//  Created by kamal abdelmonem on 17/03/2023.
//

import UIKit

extension PlayerDatailsVC: UICollectionViewDelegate, UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {
    
    func setupCollection(){
        collectionView.register(UINib(nibName: "PlayerDataSectionCVC", bundle: .none), forCellWithReuseIdentifier: "PlayerDataSectionCVC")
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.sections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PlayerDataSectionCVC", for: indexPath) as! PlayerDataSectionCVC
        cell.setupCell(section: self.sections[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        label.text = self.sections[indexPath.row].section
        var rect: CGRect = label.frame //get frame of label
        rect.size = (label.text?.size(withAttributes: [NSAttributedString.Key.font: UIFont(name: label.font.fontName , size: label.font.pointSize)!]))! //Calculate as per label font
        return CGSize(width: 66 + rect.width , height: 46)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        var c = 0
        self.sections.forEach { s in
            self.sections[c].isSelected = false
            c += 1
        }
        self.sections[indexPath.row].isSelected = true
        self.selectedSection = self.sections[indexPath.row]
        self.tableViewHeight.constant = self.getTableHeight()
        self.collectionView.reloadData()
        self.tableView.reloadData()
    }
    
}

