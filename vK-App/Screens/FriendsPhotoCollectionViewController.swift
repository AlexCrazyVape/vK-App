//
//  FriendsPhotoCollectionViewController.swift
//  vK-App
//
//  Created by ZveroKos.TV on 02.02.2020.
//  Copyright © 2020 Aleksandr Kosarev. All rights reserved.
//

import UIKit

class FriendsPhotoCollectionViewController: UICollectionViewController {
    
    var friend: User?

    override func viewDidLoad() {
        super.viewDidLoad()
                
        guard let friendName = friend?.username else {
            return
        }
        self.navigationItem.title = friendName
        collectionView.register(UINib(nibName: "PhotoCell", bundle: nil), forCellWithReuseIdentifier: "PhotoCell")
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return friend?.avatarPath.count ?? 0
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCell", for: indexPath) as! PhotoCell
        guard let friendPhoto = friend?.avatarPath else {
            fatalError()
        }
        cell.photoImageView.image = UIImage(named: (friendPhoto.self))
        return cell
    }
}
