//
//  ViewController.swift
//  Bonfire
//
//  Created by Benjamin Harvey on 4/11/16.
//  Copyright © 2016 Benjamin Harvey. All rights reserved.
//

import UIKit

class ViewController: UIViewController, KCFloatingActionButtonDelegate {

    @IBOutlet weak var publicPrivateButton: UIButton!
    
    @IBOutlet weak var flavorButton: UIButton!
    @IBOutlet weak var locationButton: UIButton!
    
    var flavorString = ""
    var publicString = ""
    var locationString = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initViews()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func initViews(){
        
        let fab = KCFloatingActionButton()
        fab.fabDelegate = self
        fab.buttonColor = UIColor(red: 0.5, green: 0.5, blue: 0.5, alpha: 1.0)
        fab.addItem(title: "sent")
        self.view.addSubview(fab)
        
        
        
        let label1 = self.publicPrivateButton?.titleLabel
        label1?.minimumScaleFactor = 0.01
        label1?.adjustsFontSizeToFitWidth = true
        
        let label2 = self.locationButton?.titleLabel
        label2?.minimumScaleFactor = 0.01
        label2?.adjustsFontSizeToFitWidth = true
        
        let label3 = self.flavorButton?.titleLabel
        label3?.minimumScaleFactor = 0.01
        label3?.adjustsFontSizeToFitWidth = true

    }
    
    func setViews(){
        if(!self.publicString.isEmpty){
            self.publicPrivateButton.titleLabel?.text = "     " + self.publicString + "     "
        }
        
        if(!self.locationString.isEmpty){
            self.locationButton.titleLabel?.text = self.locationString
        }
        
        if(!self.flavorString.isEmpty){
            self.flavorButton.titleLabel?.text = "     " + self.flavorString + "     "
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.destinationViewController is LocationTableViewController {
            let targetController = segue.destinationViewController as! LocationTableViewController
            targetController.delegate = self
        }else if segue.destinationViewController is FlavorViewController {
            let targetController = segue.destinationViewController as! FlavorViewController
            targetController.delegate = self
        }
    }

    func KCFABOpened(fab: KCFloatingActionButton) {
        
        let alert = UIAlertController(title: "Sent!", message: "Sent", preferredStyle: UIAlertControllerStyle.Alert)
        
        
        alert.addAction(UIAlertAction(title: "Yay!", style: UIAlertActionStyle.Default, handler: { action in
            fab.close()
            
        }))
        
        self.presentViewController(alert, animated: true, completion: {
            fab.close()
        })
        
    }
    
    func KCFABClosed(fab: KCFloatingActionButton) {
    }
    
    
    @IBAction func publicClicked(sender: UIButton) {
    
        let alert = UIAlertController(title: "Public or private?", message: "Do you want to post this to everybody or only to select friends from your contact book?", preferredStyle: UIAlertControllerStyle.Alert)
        
        alert.addAction(UIAlertAction(title: "Public", style: UIAlertActionStyle.Default, handler: { action in
            self.publicString = "public"
            self.setViews()
            
        }))
        
        alert.addAction(UIAlertAction(title: "Private", style: UIAlertActionStyle.Default, handler: { action in
            self.publicString = "private";
            self.setViews()
        }))
        
        self.presentViewController(alert, animated: true, completion: {
            self.setViews()
        })
    }

}
extension ViewController: FlavorViewControllerDelegate {
    func didFinishTask2(sender: FlavorViewController, choice: String) {
        self.flavorString = choice
        self.flavorButton.titleLabel?.text = self.flavorString
    }
}

extension ViewController: LocationTableViewControllerDelegate {
    func didFinishTask(sender: LocationTableViewController, choice: String) {
        self.locationString = choice
        locationButton.titleLabel?.text = "     " + self.locationString + "     "
    }
}


