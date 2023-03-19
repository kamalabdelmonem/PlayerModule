//
//  StatisticsSectionExtention.swift
//  PlayersAssesment
//
//  Created by kamal abdelmonem on 18/03/2023.
//

import UIKit

extension StatisticsSectionTVC: UITableViewDelegate, UITableViewDataSource {

    func setupTable(){
        tableView.register(UINib(nibName: "MatchesRowTVC", bundle: .none), forCellReuseIdentifier: "MatchesRowTVC")
        tableView.register(UINib(nibName: "InfoSectionTVC", bundle: .none), forCellReuseIdentifier: "InfoSectionTVC")
        tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.reloadData()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return statisticsData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if statisticsData[indexPath.row].section == "Matches" {
            let cell = tableView.dequeueReusableCell(withIdentifier: "MatchesRowTVC", for: indexPath) as! MatchesRowTVC
            cell.setupMedia(statistic: statisticsData[indexPath.row])
            cell.selectionStyle = .none
            return cell
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: "InfoSectionTVC", for: indexPath) as! InfoSectionTVC
        cell.setupCell(brief: "", title: statisticsData[indexPath.row].section ?? "", items: statisticsData[indexPath.row].data ?? [])
        cell.selectionStyle = .none
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if statisticsData[indexPath.row].section == "Matches" {
            return 120
        }else {
            if self.statisticsData[indexPath.row].data?.count ?? 0 == 0 {
                return 0
            }
            let totalTableHeight = 88 + ((self.statisticsData[indexPath.row].data?.count ?? 0) * 40)
            return CGFloat(totalTableHeight)
        }
    }


}
