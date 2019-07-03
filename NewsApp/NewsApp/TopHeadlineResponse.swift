//
//  TopHeadlineResponse.swift
//  NewsApp
//
//  Created by MacMini on 03/07/2019.
//  Copyright © 2019 com.blablabla. All rights reserved.
//

import Foundation

struct TopHeadlineResponse: Decodable {
    let articles: [Article]
}
