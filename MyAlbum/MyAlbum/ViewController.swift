//
//  ViewController.swift
//  MyAlbum
//
//  Created by Apple on 2021/02/16.
//

import UIKit

class ViewController: UIViewController {

    var currentValue = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        refresh()
    }

    @IBOutlet weak var priceLabel: UILabel!
    
    @IBAction func showAlert(_ sender: Any) {
        
        let messege = "현재 가격은 \(currentValue)원입니다."
        let alert = UIAlertController(title: "도전!", message: messege, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "OK", style: .default, handler: {action in
            self.refresh()
        }
        )
        alert.addAction(action)
        present(alert,animated: true,completion: nil)
        
        
        
    }
    
    func refresh(){
        let randomPrice = arc4random_uniform(10000)+1
        currentValue = Int(randomPrice)
        priceLabel.text = "\(currentValue)원"
    }
}

