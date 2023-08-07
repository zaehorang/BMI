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
    
    var bmiManager = BMICalculatorManager()
    
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
              
              guard let height = heightTextField.text, let weight = weightTextField.text else { return }
              
              secondVC.bmi = bmiManager.getBMI(height: height, weight: weight)
         }
        
        mainLable.text = "키와 몸무게를 입력해 주세요"
        mainLable.textColor = UIColor.black
        heightTextField.text = ""
        weightTextField.text = ""
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
