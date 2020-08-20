//
//  PdfItem.swift
//  PdfMonster
//
//  Created by ilkay sever on 20.08.2020.
//  Copyright © 2020 ilkay sever. All rights reserved.
//

import Foundation

struct PdfItem: Codable {
    
    var title: String?
    var url: String?
    
    init(title: String?, url:String?) {
        self.title = title
        self.url = url
        
    }
    
}



