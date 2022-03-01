//
//  ViewController.swift
//  ClickCounter
//
//  Created by mairo on 28/02/2022.
//

import UIKit

class ViewController: UIViewController {
    
    // creating the Count and Label Properties
    
    var count = 0 // setting count to zero
    var label:UILabel! // leaving the label undeclared for now, set label property as optional by adding ! after it ~ implicitly unwrapped optional. Otherwise compiler complains "Class 'ViewController' has no initializers"

    // do any additional setup after loading the view.
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // initialize label
        let label = UILabel()
        // without storyboard, we position label on screen with code. For this all views have a frame property and we use method (0:47) CGReact to set the x and y coordinates and height and width.
        label.frame = CGRect(x: 150, y: 150, width: 60, height: 60)
        // set our label's text to zero
        label.text = "0"
        // add our label's view to the view hierarchy so label's view is associated with our existing view. Call up the view property, add the label as a subview.
        view.addSubview(label) // .addSubview(<#T##view: UIView##UIView#>)
        // set our label property. Taking the object reference stored in a local variable viewDidLoad (white one) and giving that value a more permanent home in our property (green one). It is this connection that will enable our viewController to set the label's text when the button is clicked.
        self.label = label
        
        // let button = UIButton()
        // button.frame = CGRect(x: 150, y: 250, width: 60, height: 60)
        let button: UIButton = UIButton(frame: CGRect(x: 100, y: 400, width: 100, height: 50))
        button.backgroundColor = UIColor.blue
        button.setTitle("Click", for: .normal)
        
        // Here in the viewDidLoad we are going to add target action to our button. And here you can see the three components of thhe target action:
        
            // (1) the target, which is self
            // (2) the method to use, which is incrementCount
            // (3) control event which is touch-up inside
        
        // also tried to write incrementCount(sender:) here instead of just incrementCount
        button.addTarget(self, action: #selector(incrementCount), for: .touchUpInside)
        // button.tag = 1
        self.view.addSubview(button)
        
        
        // method that will be declared when the button is clicked. We use this self.label property to reach out of the ViewController object and modify the label. It gives us an Outlet to the label.
        
        @objc func incrementCount(sender: UIButton!) {
            /*
            let buttonSendTag: UIButton = sender
            
            if buttonSendTag.tag == 1 {
                dismiss(animated: true, completion: nil)
            */
            
            // instead of above first try below two lines
            self.count += 1 // icrement the count
            self.label.text = "\(self.count)" // set the label's text
        }
        
    }
}


