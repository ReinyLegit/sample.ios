//
//  ContentView.swift
//  Shared
//
//  Created by Eric Vidana on 5/12/21.
//

import SwiftUI
import Firebase
import FirebaseAnalytics

struct ContentView: View {
    
    // variables for instrument prices
    var guitarPrice = 199.99
    var cymbalPrice = 125.99
    
    var body: some View {
        var guitar: [String: Any] = [
            AnalyticsParameterItemID: "SKU_123",
            AnalyticsParameterItemName: "guitar 1",
            AnalyticsParameterQuantity: 1,
            AnalyticsParameterItemCategory: "instruments",
            AnalyticsParameterItemVariant: "black",
            AnalyticsParameterItemBrand: "Yamaha",
            AnalyticsParameterPrice: guitarPrice,
            AnalyticsParameterCurrency: "USD"
        ]
        var cymbal: [String: Any] = [
            AnalyticsParameterItemID: "SKU_124",
            AnalyticsParameterItemName: "cymbal 1",
            AnalyticsParameterQuantity: 1,
            AnalyticsParameterItemCategory: "instruments",
            AnalyticsParameterItemVariant: "gold",
            AnalyticsParameterItemBrand: "Zildjian",
            AnalyticsParameterPrice: cymbalPrice,
            AnalyticsParameterCurrency: "USD"
        ]
        // total value for cart
        var cartValue = guitarPrice + cymbalPrice
        var cartTransactionId = Int.random(in: 1..<5000000)
        
        Text("Hello, world!")
            .padding()
        ZStack {
            VStack {
                // view item event
                Button(action: {
                    // Universal Analytics
                    var viewItemParams: [String: Any] = [
                        AnalyticsParameterCurrency: "USD",
                        AnalyticsParameterValue: cartValue,
                        AnalyticsParameterItems: [guitar, cymbal]
                    ]
                    //Analytics.logEvent("view_item", parameters: viewItemParams)
                    Analytics.logEvent(AnalyticsEventViewItem, parameters: viewItemParams)
                })
                {
                    Text("View Items")
                }.padding(10)
                
                // add to cart event
                Button(action: {
                    // Universal Analytics
                    var viewItemParams: [String: Any] = [
                        AnalyticsParameterCurrency: "USD",
                        AnalyticsParameterValue: cartValue,
                        AnalyticsParameterItems: [guitar, cymbal]
                    ]
                    // Analytics.logEvent("add_to_cart", parameters: viewItemParams)
                    Analytics.logEvent(AnalyticsEventAddToCart, parameters: viewItemParams)
                })
                {
                    Text("Add to Cart")
                }.padding(10)
                
                // begin checkout event
                Button(action: {
                    // Universal Analytics
                    var beginCheckoutParams: [String: Any] = [
                        AnalyticsParameterCurrency: "USD",
                        AnalyticsParameterValue: cartValue,
                        AnalyticsParameterItems: [guitar, cymbal]
                    ]
                    // Analytics.logEvent("begin_checkout", parameters: beginCheckoutParams)
                    Analytics.logEvent(AnalyticsEventBeginCheckout, parameters: beginCheckoutParams)
                })
                {
                    Text("Begin Checkout")
                }.padding(10)
                
                // contact info event
                Button(action: {
                    // Universal Analytics
                    var contactInfoParams: [String: Any] = [
                        AnalyticsParameterCheckoutStep: 2
                    ]
                    // Analytics.logEvent("checkout_progress", parameters: contactInfoParams)
                    Analytics.logEvent(AnalyticsEventCheckoutProgress, parameters: contactInfoParams)
                    
                    // GA4 does not have access to the checkout_step param
                    Analytics.logEvent("checkout_contact_info", parameters: [
                        "updated": "true"
                    ])
                })
                {
                    Text("Add Contact Info")
                }.padding(10)
                
                // payment info event
                Button(action: {
                    // Universal Analytics
                    var paymentInfoParams: [String: Any] = [
                        AnalyticsParameterCheckoutStep: 3
                    ]
                    // Analytics.logEvent("checkout_progress", parameters: paymentInfoParams)
                    Analytics.logEvent(AnalyticsEventCheckoutProgress, parameters: paymentInfoParams)
                    
                    // GA4 does not have access to the checkout_step param
                    Analytics.logEvent("checkout_payment_info", parameters: [
                        "updated": "true"
                    ])
                })
                {
                    Text("Add Payment Info")
                }.padding(10)
                
                // purchase event
                Button(action: {
                    // Universal Analytics
                    var productDetails: [String: Any] = [
                        AnalyticsParameterCurrency: "USD",
                        AnalyticsParameterValue: cartValue,
                        AnalyticsParameterTransactionID: cartTransactionId,
                        AnalyticsParameterTax: 1,
                        AnalyticsParameterAffiliation: 1234,
                        AnalyticsParameterCheckoutOption: "credit_card",
                        AnalyticsParameterItems: [guitar, cymbal]
                    ]
                    // Analytics.logEvent("ecommerce_purchase", parameters: productDetails)
                    Analytics.logEvent(AnalyticsEventEcommercePurchase, parameters: productDetails)
                    
                    // GA4
                    // Analytics.logEvent("purchase", parameters: productDetails)
                    Analytics.logEvent(AnalyticsEventPurchase, parameters: productDetails)
                }) {
                    Text("Purchase")
                }.padding(10)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
