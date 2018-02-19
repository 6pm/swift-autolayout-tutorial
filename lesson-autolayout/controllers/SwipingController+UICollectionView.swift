//
//  SwipingController+UICollectionView.swift
//  lesson-autolayout
//
//  Created by Viacheslav Troian on 2/20/18.
//  Copyright © 2018 Viacheslav Troian. All rights reserved.
//

import UIKit


extension SwipingController {
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! PageCell
        //        cell.backgroundColor = indexPath.item % 2 == 0 ? .red : .green
        
        let page = pages[indexPath.item]
        cell.page = page
        //        cell.bearImageView.image = UIImage(named: page.imageName)
        //        cell.descriptionTextView.text = page.headerText
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
}
