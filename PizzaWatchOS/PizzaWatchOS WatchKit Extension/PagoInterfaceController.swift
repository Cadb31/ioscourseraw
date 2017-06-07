//
//  PagoInterfaceController.swift
//  PizzaWatchOS
//
//  Created by Carlos on 05/06/2017.
//  Copyright © 2017 Woowrale. All rights reserved.
//

import WatchKit
import Foundation


class PagoInterfaceController: WKInterfaceController {

    var pizza = Pizza()
    @IBOutlet var labelTamanio: WKInterfaceLabel!
    @IBOutlet var labelMasa: WKInterfaceLabel!
    @IBOutlet var labelQueso: WKInterfaceLabel!
    @IBOutlet var labelIngredientes: WKInterfaceLabel!
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
        if(context != nil){
            loadContext(withContext: context)
            labelTamanio.setText(pizza.tamanio)
            labelMasa.setText(pizza.masa)
            labelQueso.setText(pizza.queso)
            var ingredientes = "";
            for i in pizza.ingredientes {
               ingredientes.append(i + ", ")
            }
            labelIngredientes.setText(ingredientes)
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
    
    @IBAction func realizarAceptar() {
        if(pizza.tamanio == ""){
            showPopup(elemento: "Tamaño")
        }else if(pizza.masa == ""){
            showPopup(elemento: "Masa")
        }else if(pizza.queso == ""){
            showPopup(elemento: "Queso")
        }else if(pizza.ingredientes.count < 5){
            showPopup(elemento: "Ingredientes")
        }else{
            let contexto = "Ok"
            pushController(withName: "FinalizarPedido", context: contexto)
        }
    }

    func showPopup(elemento: String){
        
        let h0 = {print("ok")}
        let action1 = WKAlertAction.init(title: "Aceptar", style: WKAlertActionStyle.cancel, handler:h0)
        
        let title = "Notificación"
        let message = "No se ha seleccionado: " + elemento
        
        presentAlert(withTitle: title, message: message, preferredStyle: WKAlertControllerStyle.alert, actions: [action1])
        
    }
    
    func loadContext(withContext context: Any?){
        pizza = context as! Pizza        
    }

}
