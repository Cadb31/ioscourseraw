//
//  InterfaceController.swift
//  PizzaWatchOS WatchKit Extension
//
//  Created by Carlos on 04/06/2017.
//  Copyright © 2017 Woowrale. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {
    
    var pizza = Pizza()
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)

        // Configure interface objects here.
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
    
    @IBAction func seleccionarTamanio() {
        pushController(withName: "SeleccionTamanio", context: pizza)
    }
    
    @IBAction func seleccionarMasa() {
        pushController(withName: "SeleccionMasa", context: pizza)
    }
    
    
    @IBAction func seleccionarQueso() {
        pushController(withName: "SeleccionQueso", context: pizza)
    }
    
    
    @IBAction func seleccionarIngredientes() {
        pushController(withName: "SeleccionIngredientes", context: pizza)
    }
    
    @IBAction func realizarPago() {
        pushController(withName: "RealizarPago", context: pizza)
    }
    
    func loadContext(withContext context: Any?){
        pizza = context as! Pizza
        
        print(pizza.tamanio)
        print(pizza.masa)
        print(pizza.queso)
        for i in pizza.ingredientes {
            print(i)
        }
    }
}
