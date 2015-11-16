//
//  ConfirmacionViewController.swift
//  pizzapp
//
//  Created by Dev on 11/15/15.
//  Copyright © 2015 Dev. All rights reserved.
//

import UIKit

class ConfirmacionViewController: UIViewController {

    @IBOutlet weak var lblDimension: UILabel!
    @IBOutlet weak var lblMasa: UILabel!
    @IBOutlet weak var lblQueso: UILabel!
    @IBOutlet weak var lblIngredientes: UILabel!
    
    var pizza: Pizza = Pizza()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.lblDimension.text = "Tamaño: \(self.pizza.dimension!)"
        self.lblMasa.text = "Masa: \(self.pizza.masa!)"
        self.lblQueso.text = "Queso: \(self.pizza.queso!)"
        
        var str = "Ingredientes: "
        
        for ingrediente in self.pizza.ingredientes! {
            str += " \(ingrediente),"
        }
        self.lblIngredientes.text = str.substringWithRange(Range<String.Index>(start: str.startIndex, end: str.endIndex.advancedBy(-1)))
    }
    
    @IBAction func done() {
        var okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default) {
            UIAlertAction in
            self.navigationController?.popToRootViewControllerAnimated(true)
        }
        
        let alertController = UIAlertController(title: "Info", message: "Pedido enviado", preferredStyle: UIAlertControllerStyle.Alert)
        alertController.addAction(okAction)
            
        self.presentViewController(alertController, animated: true, completion: nil)
    }
    

}
