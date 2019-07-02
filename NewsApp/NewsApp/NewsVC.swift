//
//  NewsVC.swift
//  NewsApp
//
//  Created by MacMini on 01/07/2019.
//  Copyright © 2019 com.blablabla. All rights reserved.
//

import UIKit

class NewsVC: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    let article = [Article(title: "some news"),
                   Article(title: "another news"),
                   Article(title: "another news too")]

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return article.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ArticleCell", for: indexPath) as? ArticleCell else {
            return UICollectionViewCell() }
        
        let article = self.article[indexPath.row]
        cell.populate(with: article)
        
        return cell
        }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = (collectionView.frame.height / 2) - 30
        let width = (collectionView.frame.width / 2) - 2
        
        let size = CGSize(width: width, height: height)
        
        return size
    }
   
    }


