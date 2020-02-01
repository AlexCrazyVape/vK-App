//
//  FriendListTableTableViewController.swift
//  vK-App
//
//  Created by ZveroKos.TV on 02.02.2020.
//  Copyright © 2020 Aleksandr Kosarev. All rights reserved.
//

import UIKit

class FriendListTableTableViewController: UITableViewController {
    
    private let friends: [User] = [
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
    private var friendsDictionary = [String: [User]]()
    private var friendsSectionName = [String]()

    private var selectedSection = 0
    private var selectedCell = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UINib(nibName: "CustomCell", bundle: nil), forCellReuseIdentifier: "CustomCell")
        getSectionTitle()
        sortSectionTitle()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return friendsSectionName.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let key = friendsSectionName[section]
        if let friends = friendsDictionary[key] {
            return friends.count
        }
        return 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as! CustomCell

        let key = friendsSectionName[indexPath.section]
        if let friends = friendsDictionary[key] {
           // let friend = friends[indexPath.row]
            cell.TitleLabel.text = friends[indexPath.section].surname + " " + friends[indexPath.section].username
            cell.thumbnailImageView.image = UIImage(named: friends[indexPath.section].avatarPath)
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedSection = indexPath.section
        selectedCell = indexPath.row
        performSegue(withIdentifier: "toPhoto", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toPhoto" {
            let key = friendsSectionName[selectedSection]
            if let friends = friendsDictionary[key] {
                let photoCollectionView = segue.destination as! FriendsPhotoCollectionViewController
                photoCollectionView.friend = friends[selectedCell]
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return friendsSectionName[section]
    }
    
    override func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return friendsSectionName
    }
}

extension FriendListTableTableViewController {
    private func getSectionTitle() {
        for friend in friends {
            let friendKey = String(friend.surname.prefix(1))
            if var friendValues = friendsDictionary[friendKey] {
                friendValues.append(friend)
                friendsDictionary[friendKey] = friendValues
            } else {
                friendsDictionary[friendKey] = [friend]
            }
        }
    }
    
    private func sortSectionTitle() {
        friendsSectionName = [String](friendsDictionary.keys)
        friendsSectionName = friendsSectionName.sorted(by: { $0 < $1 })
    }
}
