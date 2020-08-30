//
//  DocumentsTableViewCell.swift
//  PdfMonster
//
//  Created by ilkay sever on 19.08.2020.
//  Copyright © 2020 ilkay sever. All rights reserved.
//

import UIKit

//MARK: - Delegate

protocol PdfTableviewCellDelegate {
    func didClickDownloadButton(cell: UITableViewCell, type:ProgressType)
    func didSeeButton(cell: UITableViewCell) 
}

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
        delegate?.didClickDownloadButton(cell: self, type: .show)
    }
    
    @IBAction func seeButton(_ sender: Any) {
        print("see")
        delegate?.didSeeButton(cell: self)
    }
    
}
