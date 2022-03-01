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
    var label2:UILabel!
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
        view.addSubview(label) // add subview
        // set our label property. Taking the object reference stored in a local variable viewDidLoad (white one) and giving that value a more permanent home in our property (green one). It is this connection that will enable our viewController to set the label's text when the button is clicked.
        self.label = label
        
        let label2: UILabel = UILabel(frame: CGRect(x: 150, y: 250, width: 60, height: 60))
        label2.text = "10"
        view.addSubview(label2)
        self.label2 = label2
        
        let button: UIButton = UIButton(frame: CGRect(x: 100, y: 400, width: 100, height: 50))
        button.backgroundColor = UIColor.blue
        button.setTitle("Click", for: .normal)
        
        // Here in the viewDidLoad we are going to add target action to our button. And here you can see the three components of thhe target action:
        
            // (1) the target, which is self
            // (2) the method to use, which is incrementCount
            // (3) control event which is touch-up inside
        
        button.addTarget(self, action: #selector(incrementCount), for: .touchUpInside) // no need to specify the labels of function when using in a #selector, still can #selector(incrementCount(sender:))
        self.view.addSubview(button)
        
        let button2: UIButton = UIButton(frame: CGRect(x: 100, y: 500, width: 100, height: 100))
        button2.backgroundColor = UIColor.blue
        button2.setTitle("DeClick", for: .normal)
        button2.addTarget(self, action: #selector(decrementCount), for: .touchUpInside)
        button2.addTarget(self, action: #selector(changeViewColor), for: .touchUpInside)
        self.view.addSubview(button2)
    }
    
    // move your function outside the viewDidLoad Button handler should not be within the scope of another function
    
    // method that will be declared when the button is clicked. We use this self.label property to reach out of the ViewController object and modify the label. It gives us an Outlet to the label.
    
    @objc func incrementCount(sender: UIButton!) {
        self.count += 1 // icrement the count
        self.label.text = "\(self.count)" // set the label's text
        
        // self.count += 1 // if this not commennted out, it displayes 1 and 2 after click one, 2 and 3 click 2...
        // self.label2.text = "\(self.count)"
    }
    
    // decrement count
    
    @objc func decrementCount(sender: UIButton!) {
        self.count -= 1
        self.label2.text = "\(self.count)"
        
    }
    
    @objc func changeViewColor(sender: UIButton!) {
        if self.count % 2 != 0 {
            view.backgroundColor = UIColor.orange
        } else {
            view.backgroundColor = UIColor.white
        }
    }
}

