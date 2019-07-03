//
//  NewsVC.swift
//  NewsApp
//
//  Created by MacMini on 01/07/2019.
//  Copyright © 2019 com.blablabla. All rights reserved.
//

import UIKit
import Alamofire
import Kingfisher


//APIKey: ea8641b83e804ffea368b83f83488289
/*
 curl https://newsapi.org/v2/top-headlines -G \
-d country=us \
-d apiKey=ea8641b83e804ffea368b83f83488289
 */

class NewsVC: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    var articles = [Article]()

    override func viewDidLoad() {
        super.viewDidLoad()
        getArticles()

    }
    
    func getArticles () {
        
        let parameters: Parameters = ["country" : "us",
                                       "apiKey" : "ea8641b83e804ffea368b83f83488289"]
        
        AF.request("https://newsapi.org/v2/top-headlines", parameters: parameters).responseData { (response) in
            guard let data = response.data else { return }
            
            do {
                
//                let json = try JSONSerialization.jsonObject(with: data, options: [])
//                print(json)
                
                let headlines = try JSONDecoder().decode(TopHeadlineResponse.self, from: data)
                self.articles = headlines.articles
                self.collectionView?.reloadData()
                
            } catch {
                print(error)
            }
            
            
        }
        
    }
    
    

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return articles.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ArticleCell", for: indexPath) as? ArticleCell else {
            return UICollectionViewCell() }
        
        let article = self.articles[indexPath.row]
        cell.populate(with: article)
        
        return cell
        }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = (collectionView.frame.height / 2) - 40
        let width = (collectionView.frame.width / 2) - 2
        
        let size = CGSize(width: width, height: height)
        
        return size
    }
   
    }


