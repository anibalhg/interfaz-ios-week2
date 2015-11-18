//
//  QuesoViewController.swift
//  pizzapp
//
//  Created by Dev on 11/15/15.
//  Copyright © 2015 Dev. All rights reserved.
//

import UIKit

class QuesoViewController: UITableViewController {

    var items : [String] = [String]()
    var pizza: Pizza = Pizza()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        items.append("Mozarela")
        items.append("Cheddar")
        items.append("Parmesano")
        items.append("Sin queso")
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated);
        if let queso = self.pizza.queso {
            
            for index in 0..<items.count {
                if(queso == items[index]) {
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
            let alertController = UIAlertController(title: "Validacion", message: "Debe seleccionar un queso", preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default,handler: nil))
            
            self.presentViewController(alertController, animated: true, completion: nil)
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "show" {
            let vc = segue.destinationViewController as! IngredientesViewController
            let indexPath = self.tableView.indexPathForSelectedRow!
            let queso = self.items[indexPath.row]
            vc.pizza.queso = queso
            vc.pizza.dimension = self.pizza.dimension
            vc.pizza.masa = self.pizza.masa
            vc.pizza.ingredientes = self.pizza.ingredientes
            self.pizza = vc.pizza
            let prev : MasaViewController = self.navigationController!.viewControllers[1] as! MasaViewController
            prev.pizza.masa = self.pizza.masa
            prev.pizza.queso = self.pizza.queso
            prev.pizza.ingredientes = self.pizza.ingredientes
        }
    }

}
