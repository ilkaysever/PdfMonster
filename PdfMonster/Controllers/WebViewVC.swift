//
//  WebViewVC.swift
//  PdfMonster
//
//  Created by ilkay sever on 20.08.2020.
//  Copyright © 2020 ilkay sever. All rights reserved.
//

import UIKit
import WebKit

class WebViewVC: UIViewController {
    
    @IBOutlet weak var pdfWebView: WKWebView!
    
    var urlString: String? = ""
    var url: URL!
    
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
        pdfWebView.loadFileURL(url!, allowingReadAccessTo: url!)
    }
    
}
