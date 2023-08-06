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
    
    var bmi: Double?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        heightTextField.delegate = self
        weightTextField.delegate = self
        
        makeUI()
        
    }
    
    func makeUI() {
        mainLable.text = "키와 몸무게를 입력해 주세요"
        heightTextField.placeholder = "cm단위로 입력해주세요"
        weightTextField.placeholder = "kg단위로 입력해주세요"
        
        calculateButton.layer.masksToBounds = true
        calculateButton.layer.cornerRadius = 5
        
    }
    
    @IBAction func calculateButtonTapped(_ sender: UIButton) {
        bmi = calculateBMI(height: heightTextField.text!, weight: weightTextField.text!)
        // 빈문자열도 문자열이기 때문에 상관 없음 -> nil 값이 나오지 않는다.
    }
    
    // 두 개의 텍스트 필드가 작성이 되어야만 다음 화면으로 넘거가기 위해 shoulPerformSwque 메서드 재정의
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        
        if heightTextField.text == "" || weightTextField.text == ""
              {
            mainLable.text = "키와 몸무게를 입력하셔야만 합니다!!!"
            mainLable.textColor = UIColor.red
            return false
              }
        return true
    }


    // 다음 화면에 데이터 전달을 위해 prepare 메서드 재정의
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            
          if segue.identifier == "toSecondVC" {
              let secondVC = segue.destination as! SecondViewController
              secondVC.bmiNumber = self.bmi
              secondVC.bmiColor = getBackgroundColor()
              secondVC.adviceString = getBMIAdviceString()
         }
        
        mainLable.text = "키와 몸무게를 입력해 주세요"
        mainLable.textColor = UIColor.black
        heightTextField.text = ""
        weightTextField.text = ""
    }
    
    // bmi 계산 메서드
    func calculateBMI(height: String, weight: String) -> Double {
        guard let h = Double(height), let w = Double(weight) else { return 0.0 }
        var bmi = w / (h * h) * 10000
        bmi = round(bmi * 10) / 10
        return bmi
    }
    
    // 색깔 얻는 메서드
    func getBackgroundColor() -> UIColor {
        guard let bmi = bmi else { return UIColor.black }
        switch bmi {
        case ..<18.6:
            return UIColor(displayP3Red: 22/255, green: 231/255, blue: 207/255, alpha: 1)
        case 18.6..<23.0:
            return UIColor(displayP3Red: 212/255, green: 251/255, blue: 121/255, alpha: 1)
        case 23.0..<25.0:
            return UIColor(displayP3Red: 218/255, green: 127/255, blue: 163/255, alpha: 1)
        case 25.0..<30.0:
            return UIColor(displayP3Red: 255/255, green: 150/255, blue: 141/255, alpha: 1)
        case 30.0...:
            return UIColor(displayP3Red: 255/255, green: 100/255, blue: 78/255, alpha: 1)
        default:
            return UIColor.black
        }
    }
    
    // 문자열 얻는 메서드
    func getBMIAdviceString() -> String {
        guard let bmi = bmi else { return "" }
        switch bmi {
        case ..<18.6:
            return "저체중"
        case 18.6..<23.0:
            return "표준"
        case 23.0..<25.0:
            return "과체중"
        case 25.0..<30.0:
            return "중도비만"
        case 30.0...:
            return "고도비만"
        default:
            return ""
        }
    }
}



//MARK: - 확장: UITextFieldDelegate

extension ViewController: UITextFieldDelegate {
    
    // 키보드에서 엔터 누르면 다음 텍스트 필드로 넘어가고, 마지막에서는 키보드 내리는 함수
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == heightTextField {
            heightTextField.resignFirstResponder()
            weightTextField.becomeFirstResponder()
        } else if textField == weightTextField {
            weightTextField.resignFirstResponder()
        }
        return true
    }
    
    //텍스트 필드에 숫자만 입력할 수 있게 하는 함수
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
            let allowedCharacters = CharacterSet.decimalDigits
            let characterSet = CharacterSet(charactersIn: string)
            return allowedCharacters.isSuperset(of: characterSet)
        }
    
    // 텍스트필드 외부 하면 터치시 키보드 내리기 위한 함수
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        heightTextField.endEditing(true)
        weightTextField.endEditing(true)
    }
    
    
}
