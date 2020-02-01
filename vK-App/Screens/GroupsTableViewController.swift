//
//  GroupsTableViewController.swift
//  vK-App
//
//  Created by ZveroKos.TV on 02.02.2020.
//  Copyright © 2020 Aleksandr Kosarev. All rights reserved.
//

import UIKit

class GroupsTableViewController: UITableViewController {
    
    let groups = [
        Group(groupname: "Aerosmith",  avatarPath: "aerosmith"),
        Group(groupname: "Bon Jovi",  avatarPath: "bonjovi"),
        Group(groupname: "Korn",  avatarPath: "korn"),
        Group(groupname: "Linkin Park",  avatarPath: "linkinpark"),
        Group(groupname: "Metallica",  avatarPath: "metallica"),
        Group(groupname: "Misfits",  avatarPath: "misfits"),
        Group(groupname: "Nirvana",  avatarPath: "nirvana"),
        Group(groupname: "OffSpring",  avatarPath: "offspring"),
        Group(groupname: "Pink Floyd",  avatarPath: "pinkfloyd"),
        Group(groupname: "Red Hot Chili Peppers",  avatarPath: "rhcp"),
        Group(groupname: "Sex Pistols",  avatarPath: "sexpistols"),
        Group(groupname: "Three Days Grace",  avatarPath: "threedaysgrace"),
        Group(groupname: "ДДТ",  avatarPath: "ddt"),
        Group(groupname: "Ленинград",  avatarPath: "leningrad"),
        Group(groupname: "Нервы",  avatarPath: "nervyi"),
        Group(groupname: "План Ломоносова",  avatarPath: "planlomonosova")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groups.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "GroupCell", for: indexPath) as! GroupCell

        let group = groups[indexPath.row]
        cell.groupName.text = group.groupname
        cell.groupThumnailImageView.image = UIImage(named: group.avatarPath)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}
