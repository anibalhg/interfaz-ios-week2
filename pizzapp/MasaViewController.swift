//
//  ViewController.swift
//  pizzapp
//
//  Created by Dev on 10/11/15.
//  Copyright © 2015 Dev. All rights reserved.
//

import UIKit

class MasaViewController: UITableViewController {
    
    var items : [String] = [String]()
    var pizza: Pizza = Pizza()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        items.append("Delgada")
        items.append("Crujiente")
        items.append("Gruesa")
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated);
        if let masa = self.pizza.masa {
            
            for index in 0..<items.count {
                if(masa == items[index]) {
                    let rowToSelect: NSIndexPath = NSIndexPath(forRow: index, inSection: 0);
                    self.tableView.selectRowAtIndexPath(rowToSelect, animated: true, scrollPosition: UITableViewScrollPosition.None)
                }
            }
            
            
        }
        
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCellWithIdentifier("cell") as UITableViewCell!
        cell.textLabel?.text = items[indexPath.row]
        return cell
    }
    
    @IBAction func next() {
        if let indexPath = self.tableView.indexPathForSelectedRow {
            self.performSegueWithIdentifier("show", sender: self)
        }
        else {
            let alertController = UIAlertController(title: "Validacion", message: "Debe seleccionar una masa", preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default,handler: nil))
            
            self.presentViewController(alertController, animated: true, completion: nil)
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "show" {
            
            let vc = segue.destinationViewController as! QuesoViewController
            let indexPath = self.tableView.indexPathForSelectedRow!
            let masa = self.items[indexPath.row]
            vc.pizza.masa = masa
            vc.pizza.dimension = self.pizza.dimension
            vc.pizza.queso = self.pizza.queso
            vc.pizza.ingredientes = self.pizza.ingredientes
            self.pizza = vc.pizza
            let prev : SizeViewController = self.navigationController!.viewControllers[0] as! SizeViewController
            prev.pizza.masa = self.pizza.masa
            prev.pizza.queso = self.pizza.queso
            prev.pizza.ingredientes = self.pizza.ingredientes
        }
    }
    
    
}

