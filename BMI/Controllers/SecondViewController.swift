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
    
    // 전화면에서 전달받은 BMI를 저장하기 위한 변수
    var bmi: BMI?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        makeUI()
    }
    
    func makeUI() {
        
        // 전화면에서 전달받은 BMI를 통해 셋팅
        guard let bmi = bmi else { return }
        bmiNumberLable.text = String(bmi.value)
        bmiNumberLable.backgroundColor = bmi.matchColor
        adviceLable.text = bmi.advice
        
        backButton.layer.masksToBounds = true
        backButton.layer.cornerRadius = 5
        
        bmiNumberLable.layer.masksToBounds = true
        bmiNumberLable.layer.cornerRadius = 8
    }
    

    @IBAction func backButtonTapped(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
}
