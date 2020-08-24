//
//  DocumentsVC.swift
//  PdfMonster
//
//  Created by ilkay sever on 19.08.2020.
//  Copyright © 2020 ilkay sever. All rights reserved.
//

import UIKit
import Alamofire
import WebKit
import MBProgressHUD

class DocumentsVC: UIViewController {
    
    @IBOutlet weak var documentsTableView: UITableView!
    @IBOutlet weak var backgrounImgView: UIImageView!
    
    var pdfUrl: URL?
    var fileLocalURLDict = [Int: String]()
    var pdfArray: [PdfItem] = [
        PdfItem(title: "Accessory Design Guidelines for Apple Devices", url: "https://developer.apple.com/accessories/Accessory-Design-Guidelines.pdf"),
        PdfItem(title: "Application Developer’s Guide", url: "https://docs.marklogic.com/guide/app-dev.pdf"),
        PdfItem(title: "Annual Report 2009", url: "http://www.iso.org/iso/annual_report_2009.pdf"),
        PdfItem(title: "Android Programming Cookbook", url: "https://enos.itcollege.ee/~jpoial/allalaadimised/reading/Android-Programming-Cookbook.pdf")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        setDelegates()
        setBackground()
    }
    
    func setDelegates() {
        documentsTableView.delegate = self
        documentsTableView.dataSource = self
        documentsTableView.register(DocumentsTableViewCell.self)
    }
    
    func setBackground() {
        backgrounImgView.layer.opacity = 0.7
    }
    
}

//MARK: - TableView Methods

extension DocumentsVC: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pdfArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: DocumentsTableViewCell = tableView.dequeueReusableCell(for: indexPath)
        cell.fillCell(pdfResponse: pdfArray[indexPath.row])
        cell.delegate = self
        return cell
    }
}

//MARK: - Delegate Methods

extension DocumentsVC: PdfTableviewCellDelegate {
    
    func didClickDownloadButton(cell: UITableViewCell) {
        
        guard let url = URL(string: "https://enos.itcollege.ee/~jpoial/allalaadimised/reading/Android-Programming-Cookbook.pdf") else {return}
        let urlSession = URLSession(configuration: .default, delegate: self, delegateQueue: OperationQueue())
        let downloadTask = urlSession.downloadTask(with: url)
        downloadTask.resume()
        
        //        (cell as! DocumentsTableViewCell).seeButton.isEnabled = false
        //        let indexPath = self.documentsTableView.indexPath(for: cell)
        //        print(indexPath?.row ?? "")
        //
        //        if let index = indexPath?.row {
        //            (cell as! DocumentsTableViewCell).seeButton.isEnabled = true
        //            downloadFileWithIndex(index: index)
        //        }
    }
    
    func didSeeButton(cell: UITableViewCell) {
        
        //let pdfView = WebViewVC()
        //pdfView.pdfURL = self.pdfUrl
        let storyBoard = UIStoryboard(name: "WebView", bundle: nil)
        let nextViewController = storyBoard.instantiateViewController(identifier: "WebViewVC") as WebViewVC
        self.navigationController?.pushViewController(nextViewController, animated: true)
        nextViewController.pdfURL = self.pdfUrl
        
        //        let indexPath = self.documentsTableView.indexPath(for: cell)
        //        print(indexPath?.row ?? "")
        //
        //        if let index = indexPath?.row {
        //            let storyBoard = UIStoryboard(name: "WebView", bundle: nil)
        //            let nextViewController = storyBoard.instantiateViewController(identifier: "WebViewVC") as WebViewVC
        //            self.navigationController?.pushViewController(nextViewController, animated: true)
        //            let urlString: String! = fileLocalURLDict[index]
        //            nextViewController.pdfURL = self.pdfUrl
        //        }
    }
    
//        func downloadFileWithIndex() {
//            let hud = MBProgressHUD.showAdded(to: view, animated: true)
//            hud.mode = MBProgressHUDMode.indeterminate
//            hud.show(animated: true)
//            hud.label.text = "Loading..."
//
//            let urlString = pdfArray[index].url
//
//            let destination: DownloadRequest.Destination = { _, _ in
//                let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
//                print("*************documentURL:***************", documentsURL)
//                let fileURL = documentsURL.appendingPathComponent("\(index).pdf")
//                print("*************fileURL:*************", fileURL)
//                return (fileURL, [.removePreviousFile, .createIntermediateDirectories])
//            }
//
//            let url = URL(string: urlString ?? "")!
//            let task = URLSession.shared.downloadTask(with: url) { localURL, urlResponse, error in
//                if let localURL = localURL {
//                    DispatchQueue.main.async {
//                        hud.hide(animated: true)
//                    }
//                    if let string = try? String(contentsOf: localURL) {
//                        print(string)
//                    }
//                }
//            }
//
//            task.resume()
//
//            AF.download(urlString ?? "", to: destination).response { response in
//                debugPrint(response)
//                hud.hide(animated: true)
//                if response.error == nil, let filePath = response.fileURL?.path {
//                    self.fileLocalURLDict[index] = filePath
//                }
//            }
//        }
}

extension DocumentsVC: URLSessionDownloadDelegate {
    
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didFinishDownloadingTo location: URL) {
        print("Dosyanın Yüklendiği Yer:", location)
        
        guard let url = downloadTask.originalRequest?.url else {return}
        let docsPath = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask)[0]
        let destinationPath = docsPath.appendingPathComponent(url.lastPathComponent)
        
        try? FileManager.default.removeItem(at: destinationPath)
        
        do{
            try FileManager.default.copyItem(at: location, to: destinationPath)
            self.pdfUrl = destinationPath
            print("Dosyanın Yüklendiği Yer:", self.pdfUrl ?? "NOT")
        } catch let error {
            print("Copy Error: \(error.localizedDescription)")
        }
    }
}
