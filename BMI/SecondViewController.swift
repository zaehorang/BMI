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
    
    // 전화면에서 전달받은 데이터들
    var bmiNumber: Double?
    var adviceString: String?
    var bmiColor: UIColor?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // 전 화면에서 데이터 받아온 것 -> text, backgroundColor는 둘 다 옵셔널 타입이라 옵셔널 바인딩 해주지 않아도 괜찮다.
        guard let bmi = bmiNumber else { return }
        bmiNumberLable.text = String(bmi)
        bmiNumberLable.backgroundColor = bmiColor
        adviceLable.text = adviceString
        
        makeUI()
        
    }
    
    func makeUI() {
        backButton.layer.masksToBounds = true
        backButton.layer.cornerRadius = 5
        
        bmiNumberLable.layer.masksToBounds = true
        bmiNumberLable.layer.cornerRadius = 8
    }
    

    @IBAction func backButtonTapped(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
}
