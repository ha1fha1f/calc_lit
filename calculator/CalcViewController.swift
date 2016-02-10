//
//  ViewController.swift
//  calculator
//
//  Created by 山口智生 on 2016/02/10.
//  Copyright © 2016年 ha1f. All rights reserved.
//

import UIKit

class CalcViewController: UIViewController {
    
    @IBOutlet var panel: UILabel!
    
    var controller = CalcController()

    override func viewDidLoad() {
        super.viewDidLoad()
        controller.clear()
        updateView()
    }
    
    func updateView() {
        panel.text = controller.composePanelString()
    }
    
    @IBAction func onPressedNumber(button: UIButton!) {
        
        let number = button.tag - 10
        controller.appendNumber(number)
        
        updateView()
    }
    
    @IBAction func onPressedOperand(button: UIButton!) {
        let operatorIndex = button.tag - 5
        guard (operatorIndex >= 0) && (operatorIndex < 4) else {
            return
        }
        
        let ope = Calc.CalcOperator(rawValue: operatorIndex)!
        controller.pressedOperator(ope)
        
        updateView()
    }
    
    @IBAction func onPressedDot() {
        controller.pressedDot()
        updateView()
    }
    
    @IBAction func onPressedClear() {
        controller.clear()
        updateView()
    }
    
    @IBAction func onPressedPercent() {
        controller.pressedPercent()
        updateView()
    }
    
    @IBAction func onPressedEnter(button: UIButton!) {
        controller.pressedEnter()
        updateView()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

