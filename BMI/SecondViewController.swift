//
//  SecondViewController.swift
//  BMI
//
//  Created by zaehorang on 2023/08/06.
//

import UIKit

class SecondViewController: UIViewController {

    
    @IBOutlet weak var bmiNumberLable: UILabel!
    @IBOutlet weak var adviceLable: UILabel!
    @IBOutlet weak var backButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        makeUI()
        
    }
    
    func makeUI() {
        view.backgroundColor = .systemGray5
        
        backButton.layer.masksToBounds = true
        backButton.layer.cornerRadius = 5
        
        bmiNumberLable.layer.masksToBounds = true
        bmiNumberLable.layer.cornerRadius = 8
        bmiNumberLable.backgroundColor = UIColor.green
    }
    

    @IBAction func backButtonTapped(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
}
