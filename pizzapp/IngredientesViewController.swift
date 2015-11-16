//
//  IngredientesViewController.swift
//  pizzapp
//
//  Created by Dev on 11/15/15.
//  Copyright © 2015 Dev. All rights reserved.
//

import UIKit

class IngredientesViewController: UITableViewController {

    var items : [String] = [String]()
    var pizza: Pizza = Pizza()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        items.append("jamón")
        items.append("pepperoni")
        items.append("pavo")
        items.append("salchicha")
        items.append("aceituna")
        items.append("cebolla")
        items.append("pimiento")
        items.append("piña")
        items.append("anchoa")
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
        
        let rows = self.tableView.indexPathsForSelectedRows?.map{$0.row}
        let size = rows?.count
        if size != nil && (size >= 1 && size <= 5) {
            self.performSegueWithIdentifier("show", sender: self)
        }
        else {
            let alertController = UIAlertController(title: "Validacion", message: "Debe seleccionar de 1 a 5 ingredientes", preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default,handler: nil))
            
            self.presentViewController(alertController, animated: true, completion: nil)
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "show" {
            let vc = segue.destinationViewController as! ConfirmacionViewController
            let rows = self.tableView.indexPathsForSelectedRows?.map{$0.row}
            var ingredientes = [String]()
            for index in rows! {
                let ingrediente = self.items[index]
                ingredientes.append(ingrediente)
            }
            vc.pizza.ingredientes = ingredientes
            vc.pizza.queso = self.pizza.queso
            vc.pizza.dimension = self.pizza.dimension
            vc.pizza.masa = self.pizza.masa
        }
    }

}
