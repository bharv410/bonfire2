//
//  FlavorViewController.swift
//  Bonfire
//
//  Created by Benjamin Harvey on 4/16/16.
//  Copyright © 2016 Benjamin Harvey. All rights reserved.
//

import UIKit

//https://makeapppie.com/tag/uipickerview-in-swift/


class FlavorViewController: ViewController,UIPickerViewDataSource,UIPickerViewDelegate {
@IBOutlet weak var flavorBackClick: UIButton!
    
    @IBOutlet weak var flavorPicker: UIPickerView!
    let pickerData = ["🍃","🔥","🍊","🍎","🍐","🍍","🍉","🍇","🍒"]
    
    
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
        flavorBackClick.titleLabel!.text = pickerData[row]
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
