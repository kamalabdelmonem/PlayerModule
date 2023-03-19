//
//  TableExtention.swift
//  PlayersAssesment
//
//  Created by kamal abdelmonem on 18/03/2023.
//

import UIKit

extension PlayerDatailsVC: UITableViewDelegate, UITableViewDataSource {
    
    func setupTable(){
        tableView.register(UINib(nibName: "InfoSectionTVC", bundle: .none), forCellReuseIdentifier: "InfoSectionTVC")
        tableView.register(UINib(nibName: "StatisticsSectionTVC", bundle: .none), forCellReuseIdentifier: "StatisticsSectionTVC")
        tableView.register(UINib(nibName: "EventsSectionTVC", bundle: .none), forCellReuseIdentifier: "EventsSectionTVC")
        tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if selectedSection?.section == "Info" {
            var sections = 0
            if playerBrief != "" || (playerIndicators.count > 0) {
                sections += 1
            }
            if playerRating.count > 0 {
                sections += 1
            }
            return sections
        }
        if selectedSection?.section == "Statistics" {
            return 1
        }
        if selectedSection?.section == "Events" {
            return playerEvents.count
        }
        if selectedSection?.section == "Media" {
            return 1
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if selectedSection?.section == "Info" {
            let cell = tableView.dequeueReusableCell(withIdentifier: "InfoSectionTVC", for: indexPath) as! InfoSectionTVC
            if (playerBrief != "" || (playerIndicators.count > 0)) && indexPath.row == 0 {
                cell.setupCell(brief: playerBrief, title: "About Player", items: playerIndicators)
            }else{
                cell.setupCell(brief: "", title: "Ratings", items: playerRating)
            }
            cell.selectionStyle = .none
            return cell
        }
        if selectedSection?.section == "Statistics" {
            let cell = tableView.dequeueReusableCell(withIdentifier: "StatisticsSectionTVC", for: indexPath) as! StatisticsSectionTVC
            cell.setupStatistics(leages: self.playerStatistics,selectedIndex:selectedStatisticsSection)
            cell.delegate = self
            cell.selectionStyle = .none
            return cell
        }
        if selectedSection?.section == "Events" {
            let cell = tableView.dequeueReusableCell(withIdentifier: "EventsSectionTVC", for: indexPath) as! EventsSectionTVC
            if indexPath.row == 0 {
                cell.setupEvents(item: self.playerEvents[indexPath.row], isHeader: true)
            }else{
                cell.setupEvents(item: self.playerEvents[indexPath.row], isHeader: false)
            }
            cell.selectionStyle = .none
            return cell
        }
        if selectedSection?.section == "Media" {
            let cell = tableView.dequeueReusableCell(withIdentifier: "InfoSectionTVC", for: indexPath) as! InfoSectionTVC
            cell.setupMedia(items: playerMedias)
            cell.selectionStyle = .none
            return cell
        }
        return UITableViewCell()
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView == self.scrollView {
            if scrollView.contentOffset.y > (190) {
                // show scroll btn
                UIView.animate(withDuration: 0.4, delay: 0) {
                    self.scrollToUpView.alpha = 1
                }
            }else{
                UIView.animate(withDuration: 0.4, delay: 0) {
                    self.scrollToUpView.alpha = 0
                }
            }
        }
    }
}

