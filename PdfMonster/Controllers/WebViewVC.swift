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
    
    var pdfView = PDFView()
    var pdfURL: URL!
    var urlString: String? = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(pdfView)
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        
        if let document = PDFDocument(url: pdfURL) {
            pdfView.document = document
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now()+3, execute: {
            self.dismiss(animated: true, completion: nil)
        })
        
    }
    
    override func viewDidLayoutSubviews() {
        pdfView.frame = self.view.frame
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        //setURL()
    }
    
//    func setURL() {
//        let fileURL = URL(fileURLWithPath: self.urlString ?? "")
//        let request = URLRequest(url: fileURL)
//        self.pdfWebView.load(request)
//    }
    
}
