//
//  TamanioInterfaceController.swift
//  PizzaWatchOS
//
//  Created by Carlos on 05/06/2017.
//  Copyright © 2017 Woowrale. All rights reserved.
//

import WatchKit
import Foundation

class TamanioInterfaceController: WKInterfaceController {
    
    var pizza = Pizza()
    let tamanios = ["Pequeña", "Mediana", "Grande", "Familiar"]

    @IBOutlet var tamanioTable: WKInterfaceTable!
    
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
        pizza.tamanio = tamanios[rowIndex]
        self.pushController(withName: "PizzaMenuContext", context: pizza)
    }
    
    func loadRowsTable() {
        tamanioTable.setNumberOfRows(tamanios.count, withRowType: "TamanioRowController")
        var c = 0
        for _ in tamanios {
            if let row = tamanioTable.rowController(at: c) as? RowController {
                row.rowLabel.setText(tamanios[c])
            }
            c = c+1
        }
    }
    
    func loadContext(withContext context: Any?){
        pizza = context as! Pizza
        //print(pizza.tamanio)
    }
}
