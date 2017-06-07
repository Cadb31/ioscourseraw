//
//  MasaInterfaceController.swift
//  PizzaWatchOS
//
//  Created by Carlos on 05/06/2017.
//  Copyright © 2017 Woowrale. All rights reserved.
//

import WatchKit
import Foundation


class MasaInterfaceController: WKInterfaceController {

    var pizza = Pizza()
    let masas = ["Delgada", "Crujiente", "Gruesa", "Sin Gluten"]
    
    @IBOutlet var masaTable: WKInterfaceTable!
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
        loadRowsTable()
        if(context != nil){
            loadContext(withContext: context)
        }
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    override func table(_ table: WKInterfaceTable, didSelectRowAt rowIndex: Int) {
        pizza.masa = masas[rowIndex]
        self.pushController(withName: "PizzaMenuContext", context: pizza)
    }
    
    func loadRowsTable() {
        masaTable.setNumberOfRows(masas.count, withRowType: "MasaRowController")
        var c = 0
        for _ in masas {
            if let row = masaTable.rowController(at: c) as? RowController {
                row.rowLabel.setText(masas[c])
            }
            c = c+1
        }
    }
    
    func loadContext(withContext context: Any?){
        pizza = context as! Pizza
        //print(pizza.tamanio)
        //print(pizza.masa)
    }

}
