//
//  StatisticsSectionTVC.swift
//  PlayersAssesment
//
//  Created by kamal abdelmonem on 18/03/2023.
//

import UIKit

class StatisticsSectionTVC: UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var tableViewHeight: NSLayoutConstraint!


    var leages:[Statistic] = []
    var statisticsData:[StatisticData] = []
    var selectedStatistic: Statistic?
    var delegate:PassingTableHeight?
    var selectedIndex:Int?
    override func awakeFromNib() {
        super.awakeFromNib()
        setupTable()
        setupCollection()
    }

    func setupStatistics(leages:[Statistic],selectedIndex:Int){
        self.leages = leages
        self.selectedIndex = selectedIndex
        self.selectedStatistic = self.leages[self.selectedIndex!]
        self.statisticsData = self.selectedStatistic?.data ?? []
        var c = 0
        self.leages.forEach { l in
            if c == selectedIndex {
                self.leages[c].isSelected = true
            }else{
                self.leages[c].isSelected = false
            }
            c += 1
        }
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
