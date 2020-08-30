//
//  WebViewVC.swift
//  PdfMonster
//
//  Created by ilkay sever on 20.08.2020.
//  Copyright © 2020 ilkay sever. All rights reserved.
//

import UIKit
import WebKit
import PDFKit

class WebViewVC: UIViewController {
    
    @IBOutlet weak var pdfWebView: WKWebView!
    
    var urlString: String? = ""
    var url: URL!
    var pdfView = PDFView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setURL()
    }
    
    func setURL() {
        let url = URL(string: "file:///Users/ilkaysever/Library/Developer/CoreSimulator/Devices/D429FA6E-7E62-4F7B-8743-07048CB76581/data/Containers/Data/Application/37B776ED-E0FE-47CD-886C-39CE6720E5F6/Library/Caches/Android-Programming-Cookbook.pdf")
        pdfWebView.loadFileURL(url!, allowingReadAccessTo: url!)
    }
    
}
