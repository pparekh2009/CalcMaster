//
//  ViewController.swift
//  Calculator
//
//  Created by Priyansh Parekh on 5/30/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var btnAC: RoundButton!
    @IBOutlet weak var btnPosNeg: RoundButton!
    @IBOutlet weak var btnPercent: RoundButton!
    @IBOutlet weak var btnDivide: RoundButton!
    @IBOutlet weak var btnMultiply: RoundButton!
    @IBOutlet weak var btnSubtract: RoundButton!
    @IBOutlet weak var btnAdd: RoundButton!
    @IBOutlet weak var btnEquals: RoundButton!
    @IBOutlet weak var btnDecimal: RoundButton!
    @IBOutlet weak var btnZero: RoundButton!
    @IBOutlet weak var btnOne: RoundButton!
    @IBOutlet weak var btnTwo: RoundButton!
    @IBOutlet weak var btnThree: RoundButton!
    @IBOutlet weak var btnFour: RoundButton!
    @IBOutlet weak var btnFive: RoundButton!
    @IBOutlet weak var btnSix: RoundButton!
    @IBOutlet weak var btnSeven: RoundButton!
    @IBOutlet weak var btnEight: RoundButton!
    @IBOutlet weak var btnNine: RoundButton!
    
//    @IBOutlet weak var expLabel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    
    var number1: Double = 0
    var number2: Double = 0
    
    var operatorPressed = false
    var currentOp = Operator.None
    
    enum Operator {
        case Add
        case Sub
        case Mul
        case Div
        case None
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        expLabel.text = ""
        resultLabel.text = "0"
    }


    @IBAction func clear(_ sender: RoundButton) {
//        expLabel.text = ""
        resultLabel.text = "0"
        
        currentOp = Operator.None
        resetOpBtn()
        
        number1 = 0
        number2 = 0
    }
    
    @IBAction func setPosNeg(_ sender: RoundButton) {
//        var exp = expLabel.text ?? ""
        var exp = resultLabel.text ?? ""
        if exp.hasPrefix("-") {
            exp.remove(at: exp.startIndex)
        } else {
            exp = "-" + exp
        }
        
//        expLabel.text = exp
        resultLabel.text = exp
    }
    
    @IBAction func calcPercent(_ sender: RoundButton) {
//        let result = (Double(expLabel.text!) ?? 0) / 100
        let result = (Double(resultLabel.text!) ?? 0) / 100
        resultLabel.text = "\(self.formatNumber(result))"
//        expLabel.text = "\(self.formatNumber(result))"
        resultLabel.text = "\(self.formatNumber(result))"
    }
    
    @IBAction func divide(_ sender: RoundButton) {
//        number1 = Double(expLabel.text!) ?? 0
        number1 = Double(resultLabel.text!) ?? 0
        
        if currentOp != Operator.None {
            resetOpBtn()
        }
        
        btnDivide.backgroundColor = UIColor.white
        btnDivide.setTitleColor(UIColor.systemOrange, for: .normal)
        
        currentOp = Operator.Div
        operatorPressed = true
    }
    
    @IBAction func multiply(_ sender: RoundButton) {
//        number1 = Double(expLabel.text!) ?? 0
        number1 = Double(resultLabel.text!) ?? 0
        
        if currentOp != Operator.None {
            resetOpBtn()
        }
        
        btnMultiply.backgroundColor = UIColor.white
        btnMultiply.setTitleColor(UIColor.systemOrange, for: .normal)
        
        currentOp = Operator.Mul
        operatorPressed = true
    }
    
    @IBAction func subtract(_ sender: RoundButton) {
//        number1 = Double(expLabel.text!) ?? 0
        number1 = Double(resultLabel.text!) ?? 0
        
        if currentOp != Operator.None {
            resetOpBtn()
        }
        
        btnSubtract.backgroundColor = UIColor.white
        btnSubtract.setTitleColor(UIColor.systemOrange, for: .normal)
        
        currentOp = Operator.Sub
        operatorPressed = true
    }
    
    @IBAction func add(_ sender: RoundButton) {
//        number1 = Double(expLabel.text!) ?? 0
        number1 = Double(resultLabel.text!) ?? 0
        
        if currentOp != Operator.None {
            resetOpBtn()
        }
        
        btnAdd.backgroundColor = UIColor.white
        btnAdd.setTitleColor(UIColor.systemOrange, for: .normal)
        
        currentOp = Operator.Add
        operatorPressed = true
    }
    
    @IBAction func addDecimal(_ sender: RoundButton) {
        if operatorPressed {
//            expLabel.text = "."
            resultLabel.text = "."
            operatorPressed = false
        } else {
//            expLabel.text! += "."
            resultLabel.text! += "."
        }
    }
    
    @IBAction func writeNumber(_ sender: RoundButton) {
        let number = sender.title(for: .normal)!
        
        if operatorPressed {
//            expLabel.text = number
            resultLabel.text = number
            operatorPressed = false
        } else {
//            expLabel.text! += number
            resultLabel.text! += number
        }
    }
    
    @IBAction func equals(_ sender: RoundButton) {
        if currentOp == Operator.Add || currentOp == Operator.Sub {
//            number2 = Double(expLabel.text!) ?? 0
            number2 = Double(resultLabel.text!) ?? 0
        } else if currentOp == Operator.Mul || currentOp == Operator.Div {
//            number2 = Double(expLabel.text!) ?? 1
            number2 = Double(resultLabel.text!) ?? 1
        }
        
        let result: Double = if currentOp == Operator.Add {
            number1 + number2
        } else if currentOp == Operator.Sub {
            number1 - number2
        } else if currentOp == Operator.Mul {
            number1 * number2
        } else if currentOp == Operator.Div {
            number1 / number2
        } else {
            0
        }
        
        resultLabel.text = "\(self.formatNumber(result))"
        
        number1 = result
        
        resetOpBtn()
    }
    
    func resetOpBtn() {
        if currentOp == Operator.Add {
            btnAdd.backgroundColor = UIColor.systemOrange
            btnAdd.titleLabel?.textColor = UIColor.white
        } else if currentOp == Operator.Sub {
            btnSubtract.backgroundColor = UIColor.systemOrange
            btnSubtract.titleLabel?.textColor = UIColor.white
        } else if currentOp == Operator.Mul {
            btnMultiply.backgroundColor = UIColor.systemOrange
            btnMultiply.titleLabel?.textColor = UIColor.white
        } else if currentOp == Operator.Div {
            btnDivide.backgroundColor = UIColor.systemOrange
            btnDivide.titleLabel?.textColor = UIColor.white
        }
    }
    
    func formatNumber(_ number: Double) -> String {
        if number == floor(number) {
            return String(format: "%.0f", number)
        } else {
            return String(number)
        }
    }
}

