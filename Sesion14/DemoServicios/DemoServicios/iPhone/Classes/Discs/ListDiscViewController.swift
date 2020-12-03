//
//  ListDiscViewController.swift
//  DemoServicios
//
//  Created by Kenyi Rodriguez on 3/12/20.
//  Copyright © 2020 Kenyi Rodriguez. All rights reserved.
//

import UIKit

class ListDiscViewController: UIViewController {
    
    @IBOutlet weak var clvDisc: UICollectionView!
    
    var arrayDisc = [DiscBE]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.getAllDiscs()
    }
    
    func getAllDiscs() {
        
        DiscBL.getAllDisc { (arrayDisc) in
            self.arrayDisc = arrayDisc
            self.clvDisc.reloadData()
        }
    }
}

extension ListDiscViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.arrayDisc.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cellIdentifier = "DiscCollectionViewCell"
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! DiscCollectionViewCell
        cell.objDisc = self.arrayDisc[indexPath.row]
        return cell
    }
}

extension ListDiscViewController: UICollectionViewDelegate {

}

extension ListDiscViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let internalLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout
        let insets = internalLayout?.sectionInset ?? .zero
        
        let numberOfColumns : CGFloat = 1
        let totalWidth      : CGFloat = collectionView.frame.width
        let paddingLeft     : CGFloat = insets.left
        let paddingRight    : CGFloat = insets.right
        let horizontalSpace : CGFloat = internalLayout?.minimumInteritemSpacing ?? 0
        
        let availableWidth = totalWidth - paddingLeft - paddingRight - horizontalSpace*(numberOfColumns-1)
        let cellWidth = availableWidth / numberOfColumns
        let cellHeight = cellWidth + 51
        
        let cellSize = CGSize(width: cellWidth, height: cellHeight)
        return cellSize
    }
}
































