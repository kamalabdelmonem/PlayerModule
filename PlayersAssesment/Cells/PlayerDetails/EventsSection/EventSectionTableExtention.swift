//
//  EventSectionTableExtention.swift
//  PlayersAssesment
//
//  Created by kamal abdelmonem on 19/03/2023.
//

import UIKit

extension EventsSectionTVC: UITableViewDelegate, UITableViewDataSource {
    
    func setupTable(){
        tableView.register(UINib(nibName: "EventsMatchTVC", bundle: .none), forCellReuseIdentifier: "EventsMatchTVC")
        tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return matches.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EventsMatchTVC", for: indexPath) as! EventsMatchTVC
        cell.setupMatch(item: self.matches[indexPath.row])
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 54
    }
}

