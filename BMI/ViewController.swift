//
//  ViewController.swift
//  BMI
//
//  Created by zaehorang on 2023/08/06.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var mainLable: UILabel!
    @IBOutlet weak var heightTextField: UITextField!
    @IBOutlet weak var weightTextField: UITextField!
    
    @IBOutlet weak var calculateButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        heightTextField.delegate = self
        weightTextField.delegate = self
        
        makeUI()
        
    }

    
    
    
    
    func makeUI() {
        mainLable.text = "키와 몸무게를 입력해 주세요"
        
        view.backgroundColor = .systemGray5
        
        calculateButton.layer.masksToBounds = true
        calculateButton.layer.cornerRadius = 5
        
    }
    
    @IBAction func calculateButtonTapped(_ sender: UIButton) {
    }
    
    
    
}

extension ViewController: UITextFieldDelegate {
    
    
    
}
