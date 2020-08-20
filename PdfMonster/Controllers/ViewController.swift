//
//  ViewController.swift
//  PdfMonster
//
//  Created by ilkay sever on 19.08.2020.
//  Copyright © 2020 ilkay sever. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var bckgrndImgView: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var urlTextField: UITextField!
    @IBOutlet weak var downloadButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLayers()
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
         view.endEditing(true)
         super.touchesBegan(touches, with: event)
     }
    
    @IBAction func downloadButtonTapped(_ sender: Any) {
        //let item = PdfItem(title: <#T##String?#>, url: <#T##String?#>)
    }
    
    func setLayers() {
        self.bckgrndImgView.layer.opacity = 0.7
        self.urlTextField.layer.cornerRadius = 5
        self.downloadButton.layer.cornerRadius = 5
    }
    
}

