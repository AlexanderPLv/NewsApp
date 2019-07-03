//
//  ArticleCell.swift
//  NewsApp
//
//  Created by MacMini on 01/07/2019.
//  Copyright © 2019 com.blablabla. All rights reserved.
//

import UIKit

class ArticleCell: UICollectionViewCell {
    
    @IBOutlet weak var newsImageView: UIImageView!
    @IBOutlet weak var newsLabel: UILabel!
    
    
    
    func populate (with article: Article) {
        newsLabel.text = article.title
        
        if let urlToImage = article.urlToImage {
            let url = URL(string: urlToImage)
            newsImageView.kf.setImage(with: url)
        }
    }
}
