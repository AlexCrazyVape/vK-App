//
//  MyGroupsTableViewController.swift
//  vK-App
//
//  Created by ZveroKos.TV on 26.01.2020.
//  Copyright © 2020 Aleksandr Kosarev. All rights reserved.
//

import UIKit

class MyGroupsTableViewController: UITableViewController {
    

    @IBAction func addGroup(segue: UIStoryboardSegue) {
        
        // Проверяем идентификатор перехода, чтобы убедиться, что это нужный
        if segue.identifier == "addGroup" {
        // Получаем ссылку на контроллер, с которого осуществлен переход
            guard let groupsTableViewController = segue.source as? GroupsTableViewController else { return }
        // Получаем индекс выделенной ячейки
            if let indexPath = groupsTableViewController.tableView.indexPathForSelectedRow {
        // Получаем город по индексу
                let group = groupsTableViewController.groups[indexPath.row]
        // Проверяем, что такого города нет в списке
                if !groups.contains(group) {
        // Добавляем город в список выбранных
                    groups.append(group)
        
                    tableView.reloadData()
                }
            }
        }
    }


    var groups = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()


        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return groups.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myGroups", for: indexPath) as! MyGroupsTableViewCell
        
        let group = groups[indexPath.row]
        
        cell.myGroupsName.text = group
        

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

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Удаляем город из массива
                groups.remove(at: indexPath.row)
            // И удаляем строку из таблицы
                tableView.deleteRows(at: [indexPath], with: .fade)
            }
        }

    

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
