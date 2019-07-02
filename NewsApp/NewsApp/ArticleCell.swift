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
        
    }
}
