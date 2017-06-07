//
//  IngredienteInterfaceController.swift
//  PizzaWatchOS
//
//  Created by Carlos on 05/06/2017.
//  Copyright © 2017 Woowrale. All rights reserved.
//

import WatchKit
import Foundation


class IngredienteInterfaceController: WKInterfaceController {

    var pizza = Pizza()
    let ingredientes = ["Jamon", "Pepperoni", "Pavo", "Salchicha", "Aceitunas", "Cebolla", "Pimiento", "Piña", "Carne", "Chorizo", "Champiñones"]
    
    @IBOutlet var ingredientesTable: WKInterfaceTable!
    
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
        
        if(pizza.ingredientes.count == 0){
            pizza.ingredientes.append(ingredientes[rowIndex])
        }else{
            var c = 0
            for i in pizza.ingredientes{
                if(i == ingredientes[rowIndex]){
                    c = c+1
                }
            }
            if(c == 0){
                pizza.ingredientes.append(ingredientes[rowIndex])
            }
        }
                
        if(pizza.ingredientes.count >= 5){
            self.pushController(withName: "PizzaMenuContext", context: pizza)
        }
    }
    
    func loadRowsTable() {
        ingredientesTable.setNumberOfRows(ingredientes.count, withRowType: "IngredientesRowController")
        var c = 0
        for _ in ingredientes {
            if let row = ingredientesTable.rowController(at: c) as? RowController {
                row.rowLabel.setText(ingredientes[c])
            }
            c = c+1
        }
    }
    
    func loadContext(withContext context: Any?){
        pizza = context as! Pizza
        //print(pizza.tamanio)
        //print(pizza.masa)
        //print(pizza.queso)
        
    }
}
