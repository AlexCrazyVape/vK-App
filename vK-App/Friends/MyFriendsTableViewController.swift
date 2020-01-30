//
//  MyFriendsTableViewController.swift
//  vK-App
//
//  Created by ZveroKos.TV on 27.01.2020.
//  Copyright © 2020 Aleksandr Kosarev. All rights reserved.
//

import UIKit

struct Section<T> {
    var title:String
    var items: [T]
}


class MyFriendsTableViewController: UITableViewController {


    
    var friendsSection = [Section<User>]()

    var friends = [
        User(username: "Екатерина", surname: "Ефимова", isOnline: false, avatarPath: "efimova"),
        User(username: "Константин", surname: "Ерохин", isOnline: false, avatarPath: "eroxin"),
        User(username: "Некит", surname: "Гальцов", isOnline: false, avatarPath: "galtsov"),
        User(username: "Алексей", surname: "Матейчук", isOnline: false, avatarPath: "mateichyk"),
        User(username: "Михаил", surname: "Борейко", isOnline: false, avatarPath: "boreiko"),
        User(username: "Артём", surname: "Козубняк", isOnline: false, avatarPath: "zub"),
        User(username: "Оганес", surname: "Айрапетян", isOnline: false, avatarPath: "airapetyan"),
        User(username: "Карина", surname: "Лунева", isOnline: false, avatarPath: "luneva"),
        User(username: "Бес", surname: "Шабашный", isOnline: false, avatarPath: "bes"),
        User(username: "Александр", surname: "Кузнецов", isOnline: false, avatarPath: "kuznetsov"),
        User(username: "Анастасия", surname: "Долгова", isOnline: false, avatarPath: "dolgova"),
        User(username: "Лоретта", surname: "Донцу", isOnline: false, avatarPath: "dontcy"),
        User(username: "Ксения", surname: "Суомалайнен", isOnline: false, avatarPath: "suomi"),
        User(username: "Иван", surname: "Zakker", isOnline: false, avatarPath: "zakker"),
        User(username: "Костя", surname: "Швайгер", isOnline: false, avatarPath: "shwaiger"),
        User(username: "Григорий", surname: "Зверев", isOnline: false, avatarPath: "zverev"),
        User(username: "Макс", surname: "Шишов", isOnline: false, avatarPath: "shishov"),
        User(username: "Евгений", surname: "Григорьев", isOnline: false, avatarPath: "grigoryev"),
        User(username: "Людмила", surname: "Махова", isOnline: false, avatarPath: "machova"),
        User(username: "Ольга", surname: "Маркес", isOnline: false, avatarPath: "markes"),
        User(username: "Никита", surname: "Легостев", isOnline: false, avatarPath: "st1m")
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        

        let friendsDictionary = Dictionary.init(grouping: friends){ $0.surname.prefix(1) }
        friendsSection = friendsDictionary.map { Section(title: String($0.key), items: $0.value)}
        friendsSection.sort{ $0.title < $1.title }
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return friendsSection.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return friendsSection[section].items.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "friendsList", for: indexPath) as? MyFriendsTableViewCell else {return UITableViewCell()}
       
        
        let username = friendsSection[indexPath.section].items[indexPath.row].username
        let surname = friendsSection[indexPath.section].items[indexPath.row].surname
        cell.username.text = username + " " + surname
        cell.avatar.image = UIImage(named: friendsSection[indexPath.section].items[indexPath.row].avatarPath)

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
