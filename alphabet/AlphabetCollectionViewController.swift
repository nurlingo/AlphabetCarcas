//
//  AlphabetCollectionViewController.swift
//  Quranize
//
//  Created by Nursultan Askarbekuly on 13/06/2017.
//  Copyright © 2017 Nursultan Askarbekuly. All rights reserved.
//



import UIKit


class AlphabetCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    
    let letterCellId = "letterCellId"
    let controlButtonCellId = "buttonCellId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = true
        
        setupCollectionView()
    }
    
    func setupCollectionView() {
        if let flowLayout = collectionView?.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.minimumLineSpacing = 0
        }
        
        collectionView?.backgroundColor = UIColor.rgb(254, green: 254, blue: 225)
        
        collectionView?.register(LetterCell.self, forCellWithReuseIdentifier: letterCellId)
        collectionView?.register(ControlButtonCell.self, forCellWithReuseIdentifier: controlButtonCellId)
        
        collectionView?.isPagingEnabled = true // what's that?
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section = 0 {
            return 28
        }
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.item == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: syllabusCellId, for: indexPath) as! SyllabusCell
            cell.mainController = self
            cell.tableView.reloadData()
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: contentLibraryCellId, for: indexPath) as! ContentLibraryCell
            cell.mainController = self
            cell.tableView.reloadData()
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width/4.5, height: view.frame.width/4.5)
    }
    
    
}

extension UIColor {
    static func rgb(_ red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor {
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1)
    }
}
