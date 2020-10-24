//
//  DocumentsTableViewCell.swift
//  PdfMonster
//
//  Created by ilkay sever on 19.08.2020.
//  Copyright © 2020 ilkay sever. All rights reserved.
//

import UIKit
import Firebase
import FirebaseCore
import FirebaseCrashlytics

//MARK: - Delegate

protocol PdfTableviewCellDelegate {
    func didClickDownloadButton(cell: UITableViewCell)
    func didSeeButton(cell: UITableViewCell) 
}

let userInfo = [
  NSLocalizedDescriptionKey: NSLocalizedString("The request failed.", comment: ""),
  NSLocalizedFailureReasonErrorKey: NSLocalizedString("The response returned a 404.", comment: ""),
  NSLocalizedRecoverySuggestionErrorKey: NSLocalizedString("Does this page exist?", comment: ""),
  "ProductID": "123456",
  "View": "MainView"
]

let error = NSError.init(domain: NSCocoaErrorDomain,
                         code: -1002,
                         userInfo: userInfo)

class DocumentsTableViewCell: UITableViewCell, ReusableView, NibLoadableView {
    
    var indexPath: IndexPath?
    var delegate:PdfTableviewCellDelegate!
    var pdfData: [PdfItem]?
    
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var downloadButton: UIButton!
    @IBOutlet weak var seeButton: UIButton!
    @IBOutlet weak var seperatorView: UIView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    // fill with models or pdf's url!!!
    func fillCell(pdfResponse: PdfItem) {
        titleLabel.text = "Swift Dersleri 101"
    }

    // Action Buttons
    
    @IBAction func downloadButton(_ sender: Any) {
        print("download")
        delegate?.didClickDownloadButton(cell: self)
        //fatalError()
        Analytics.logEvent("Pdf İndirildi", parameters: nil)
        Crashlytics.crashlytics().record(error: error)
    }
    
    @IBAction func seeButton(_ sender: Any) {
        print("see")
        delegate?.didSeeButton(cell: self)
        Analytics.logEvent("Pdf Açıldı", parameters: nil)
        Crashlytics.crashlytics().record(error: error)
    }
    
}
