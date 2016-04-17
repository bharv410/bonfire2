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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let theHeight = view.frame.size.height
        
        let fab = KCFloatingActionButton(frame: CGRect(x: self.view.frame.width / 2 - 25, y: theHeight - 60 , width: 50, height: 50))
         fab.fabDelegate = self
        fab.addItem(title: "Opening")
        
        self.view.addSubview(fab)
    
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
            print("here")
    
        if segue.destinationViewController is LocationTableViewController {
            //do something if it's an instance of that class
            let targetController = segue.destinationViewController as! LocationTableViewController
            targetController.delegate = self
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func KCFABOpened(fab: KCFloatingActionButton) {
        print("FAB Opened")
        //fab.close()
    }
    
    func KCFABClosed(fab: KCFloatingActionButton) {
        print("FAB Closed")
    }
    
    
    @IBAction func publicClicked(sender: UIButton) {
        let alert = UIAlertController(title: "Public or private?", message: "Do you want to post this to everybody or only to select friends from your contact book?", preferredStyle: UIAlertControllerStyle.Alert)
        
        // add the actions (buttons)
        alert.addAction(UIAlertAction(title: "Public", style: UIAlertActionStyle.Default, handler: { action in
            self.publicPrivateButton.titleLabel?.text = "     Public     "
            
        }))
        
        alert.addAction(UIAlertAction(title: "Private", style: UIAlertActionStyle.Default, handler: { action in
            self.publicPrivateButton.titleLabel?.text = "     Private     "            
        }))
        
        self.presentViewController(alert, animated: true, completion: nil)
    }

}

extension ViewController: LocationTableViewControllerDelegate {
    func didFinishTask(sender: LocationTableViewController, choice: String) {
        print(choice)
    }
}


