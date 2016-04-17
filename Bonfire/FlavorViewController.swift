//
//  FlavorViewController.swift
//  Bonfire
//
//  Created by Benjamin Harvey on 4/16/16.
//  Copyright © 2016 Benjamin Harvey. All rights reserved.
//

import UIKit
import Parse

//https://makeapppie.com/tag/uipickerview-in-swift/

protocol FlavorViewControllerDelegate: class {
    func didFinishTask2(sender: FlavorViewController, choice: String)
}

class FlavorViewController: ViewController,UIPickerViewDataSource,UIPickerViewDelegate {
@IBOutlet weak var flavorBackClick: UIButton!
    
    @IBOutlet weak var flavorPicker: UIPickerView!
    let pickerData = ["🍃","🔥","🍊","🍎","🍐","🍍","🍉","🍇","🍒"]
    
    weak var delegate:FlavorViewControllerDelegate?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.flavorPicker.dataSource = self
        self.flavorPicker.delegate = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    @IBAction func clickedBack(sender: UIButton) {
        self.dismissViewControllerAnimated(true) { 
                        
        }
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.delegate?.didFinishTask2(self , choice: pickerData[row] )
        
        
        self.dismissViewControllerAnimated(true) {
            
            
            
        }
        
    }
    
    func pickerView(pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusingView view: UIView?) -> UIView {
        var pickerLabel = view as! UILabel!
        if view == nil {  //if no label there yet
            pickerLabel = UILabel()
            //color the label's background
            //let hue = CGFloat(row)/CGFloat(pickerData.count)
            pickerLabel.backgroundColor = UIColor.lightGrayColor()
        }
        let titleData = pickerData[row]
        let myTitle = NSAttributedString(string: titleData, attributes: [NSFontAttributeName:UIFont(name: "Georgia", size: 26.0)!,NSForegroundColorAttributeName:UIColor.blackColor()])
        pickerLabel!.attributedText = myTitle
        pickerLabel!.textAlignment = .Center
        return pickerLabel
        
    }
    
    func pickerView(pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 36.0
    }
    
    //MARK: - Delegates and data sources
    //MARK: Data Sources
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
