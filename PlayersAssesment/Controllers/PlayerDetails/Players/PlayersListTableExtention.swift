//
//  tableExtention.swift
//  PlayersAssesment
//
//  Created by kamal abdelmonem on 17/03/2023.
//

import UIKit

extension PlayersListVC: UITableViewDelegate, UITableViewDataSource {
    
    func setupTable(){
        tableView.register(UINib(nibName: "PlayerItemTVC", bundle: .none), forCellReuseIdentifier: "PlayerItemTVC")
        tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.rowHeight = 100
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return players.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PlayerItemTVC", for: indexPath) as! PlayerItemTVC
        cell.setupCell(player: players[indexPath.row])
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "PlayerDatailsVC") as? PlayerDatailsVC
        vc?.playerOldData = players[indexPath.row]
        self.navigationController?.pushViewController(vc!, animated: true)
    }
}

