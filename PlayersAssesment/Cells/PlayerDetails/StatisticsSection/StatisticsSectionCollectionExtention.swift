//
//  StatisticsSectionCollectionExtention.swift
//  PlayersAssesment
//
//  Created by kamal abdelmonem on 18/03/2023.
//

import UIKit

extension StatisticsSectionTVC: UICollectionViewDelegate, UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {
    
    func setupCollection(){
        collectionView.register(UINib(nibName: "LeageSectionCVC", bundle: .none), forCellWithReuseIdentifier: "LeageSectionCVC")
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.leages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "LeageSectionCVC", for: indexPath) as! LeageSectionCVC
        cell.setupLeage(leage: self.leages[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        label.font = .systemFont(ofSize: 16, weight: .medium)
        label.text = self.leages[indexPath.row].league
        var rect: CGRect = label.frame //get frame of label
        rect.size = (label.text?.size(withAttributes: [NSAttributedString.Key.font: UIFont(name: label.font.fontName , size: label.font.pointSize)!]))! //Calculate as per label font
        return CGSize(width: rect.width + 40 , height: 42)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.delegate?.updateHeight(selectedStatisticsSection: indexPath.row)
        var c = 0
        self.leages.forEach { s in
            self.leages[c].isSelected = false
            c += 1
        }
        self.leages[indexPath.row].isSelected = true
        self.selectedStatistic = self.leages[indexPath.row]
        self.statisticsData = self.leages[indexPath.row].data ?? []
        var height = 0
        (self.selectedStatistic?.data ?? []).forEach { s in
            if s.section != "Matches" {
                height += (88 + ((s.data?.count ?? 0) * 40))
            }
        }
        self.tableViewHeight.constant = CGFloat(120 + height)
        self.collectionView.reloadData()
        self.tableView.reloadData()
    }

}
