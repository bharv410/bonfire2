//
//  ViewController.swift
//  Bonfire
//
//  Created by Benjamin Harvey on 4/11/16.
//  Copyright © 2016 Benjamin Harvey. All rights reserved.
//

import UIKit
import MessageUI
import Parse

class ViewController: UIViewController, KCFloatingActionButtonDelegate, MFMessageComposeViewControllerDelegate {

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
        
        let imageName = "sayagata-400px.png"
        let image = UIImage(named: imageName)
        
//       self.view.backgroundColor = UIColor(patternImage: image!)
        
    self.view.backgroundColor = UIColor.whiteColor()
        
    }
    
    func setViews(){
        if(!self.publicString.isEmpty){
            //self.publicPrivateButton.titleLabel?.text = "     " + self.publicString + "     "
            self.publicPrivateButton.setTitle("     " + self.publicString + "     ", forState: UIControlState.Normal)
        }
        
        if(!self.locationString.isEmpty){
            //self.locationButton.titleLabel?.text = self.locationString
            self.locationButton.setTitle(self.locationString, forState: UIControlState.Normal)
        }
        
        if(!self.flavorString.isEmpty){
            //self.flavorButton.titleLabel?.text =  self.flavorString
            self.flavorButton.setTitle(self.flavorString, forState: UIControlState.Normal)
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
        

        
        var gameScore = PFObject(className: "TestObject")
        gameScore.setObject(self.flavorString + " at " + self.locationString, forKey: "foo")
        
        
        
        gameScore.saveInBackgroundWithBlock {
            (success: Bool, error: NSError?) -> Void in
            if (success) {
                self.performSegueWithIdentifier("GoToContax", sender:self)
//                
//                let alert = UIAlertController(title: "Sent!", message: self.publicString.isEqual("Private") ? "Sent privately!" : "Sent publicly", preferredStyle: UIAlertControllerStyle.Alert)
//                
//                
//                alert.addAction(UIAlertAction(title: "Yay!", style: UIAlertActionStyle.Default, handler: { action in
//                    fab.close()
//                    
//                }))
//                
//                self.presentViewController(alert, animated: true, completion: {
//                    fab.close()
//                })
//                
//                
//                NSLog("Object created with id: (gameScore.objectId)")
//                
                
                // The object has been saved.
            } else {
                // There was a problem, check error.description
            }
        }
        
        
//        if(self.publicString.isEqual("Private")
//            && MFMessageComposeViewController.canSendText()){
//            
//            
//            
//            
//            let controller = MFMessageComposeViewController()
//                controller.body = self.flavorString + " at " + self.locationString
//                //controller.recipients = [phoneNumber.text]
//                controller.messageComposeDelegate = self
//            self.presentViewController(controller, animated: true, completion: {
//                fab.close()
//            })
//        }else{
//            
//        }
    }
    
    func KCFABClosed(fab: KCFloatingActionButton) {
    }
    
    
    func messageComposeViewController(controller: MFMessageComposeViewController!, didFinishWithResult result: MessageComposeResult) {
        //... handle sms screen actions
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func publicClicked(sender: UIButton) {
    
        let alert = UIAlertController(title: "Public or private?", message: "Do you want to post this to everybody or only to select friends from your contact book?", preferredStyle: UIAlertControllerStyle.Alert)
        
        alert.addAction(UIAlertAction(title: "Public", style: UIAlertActionStyle.Default, handler: { action in
            self.publicString = "Public"
            self.setViews()
            
        }))
        
        alert.addAction(UIAlertAction(title: "Private", style: UIAlertActionStyle.Default, handler: { action in
            self.publicString = "Private";
            self.setViews()
        }))
        
        self.presentViewController(alert, animated: true, completion: {
        })
    }

}


extension ViewController: FlavorViewControllerDelegate {
    func didFinishTask2(sender: FlavorViewController, choice: String) {
        self.flavorString = choice
        self.setViews()
    }
}

extension ViewController: LocationTableViewControllerDelegate {
    func didFinishTask(sender: LocationTableViewController, choice: String) {
        self.locationString = choice
        self.setViews()
    }
}


