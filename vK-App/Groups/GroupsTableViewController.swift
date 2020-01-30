//
//  GroupsTableViewController.swift
//  vK-App
//
//  Created by ZveroKos.TV on 26.01.2020.
//  Copyright © 2020 Aleksandr Kosarev. All rights reserved.
//

import UIKit

struct Section2<T> {
    var title:String
    var items: [T]
}

class GroupsTableViewController: UITableViewController {

var groupsSection = [Section<Group>]()

    
    var groups = [
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

        let groupsDictionary = Dictionary.init(grouping: groups){ $0.groupname.prefix(1) }
        groupsSection = groupsDictionary.map { Section(title: String($0.key), items: $0.value)}
        groupsSection.sort{ $0.title < $1.title }
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return groupsSection.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return groupsSection[section].items.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "groupsList", for: indexPath) as? GroupsTableViewCell else {return UITableViewCell()}
        
         let groupname = groupsSection[indexPath.section].items[indexPath.row].groupname
        cell.allGroupsName.text = groupname
        cell.allGroupsImage.image = UIImage(named: groupsSection[indexPath.section].items[indexPath.row].avatarPath)
        

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("нажата строка № \(indexPath.row) в секции \(indexPath.section)")
    }


    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
