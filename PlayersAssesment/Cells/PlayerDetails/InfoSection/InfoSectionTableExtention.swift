//
//  InfoSectionTableExtention.swift
//  PlayersAssesment
//
//  Created by kamal abdelmonem on 18/03/2023.
//

import UIKit

extension InfoSectionTVC: UITableViewDelegate, UITableViewDataSource {
    
    func setupTable(){
        tableView.register(UINib(nibName: "InfoSectionRowTVC", bundle: .none), forCellReuseIdentifier: "InfoSectionRowTVC")
        tableView.register(UINib(nibName: "MediaSectionRowTVC", bundle: .none), forCellReuseIdentifier: "MediaSectionRowTVC")
        tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if itemsMedias.count > 0 {
            return itemsMedias.count
        }else if itemsIndicators.count > 0 {
            return itemsIndicators.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if itemsMedias.count > 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "MediaSectionRowTVC", for: indexPath) as! MediaSectionRowTVC
            cell.setupCell(media: itemsMedias[indexPath.row])
            cell.selectionStyle = .none
            return cell
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: "InfoSectionRowTVC", for: indexPath) as! InfoSectionRowTVC
        cell.setupCell(key:itemsIndicators[indexPath.row].key ?? "",value:itemsIndicators[indexPath.row].value ?? "")
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if itemsMedias.count > 0 {
            return 324
        }else if itemsIndicators.count > 0 {
            return 40
        }
        return 0
    }
}

