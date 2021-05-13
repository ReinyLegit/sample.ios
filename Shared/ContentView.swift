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
    var body: some View {
        Text("Hello, world!")
            .padding()
        ZStack {
            VStack {
                Button(action: {
                    var guitar: [String: Any] = [
                        AnalyticsParameterItemID: "SKU_123",
                        AnalyticsParameterItemName: "guitar 1",
                        AnalyticsParameterItemCategory: "instruments",
                        AnalyticsParameterItemVariant: "black",
                        AnalyticsParameterItemBrand: "Yamaha",
                        AnalyticsParameterPrice: 199.99
                    ]
                    var productDetails: [String: Any] = [
                        AnalyticsParameterCurrency: "USD",
                        AnalyticsParameterValue: 199.99,
                        AnalyticsParameterTransactionID: Int.random(in: 1..<5000000),
                        AnalyticsParameterTax: 1,
                        AnalyticsParameterAffiliation: 1234,
                        AnalyticsParameterCheckoutOption: "credit_card"
                    ]
                    var guitar2: [String: Any] = [
                        AnalyticsParameterItemID: "SKU_123",
                        AnalyticsParameterItemName: "guitar 2",
                        AnalyticsParameterItemCategory: "instruments",
                        AnalyticsParameterItemVariant: "white",
                        AnalyticsParameterItemBrand: "Yamaha",
                        AnalyticsParameterPrice: 99.99
                    ]
                    var productDetails2: [String: Any] = [
                        AnalyticsParameterCurrency: "USD",
                        AnalyticsParameterValue: 99.99,
                        AnalyticsParameterTransactionID: Int.random(in: 1..<5000000),
                        AnalyticsParameterTax: 1,
                        AnalyticsParameterAffiliation: 1234,
                        AnalyticsParameterCheckoutOption: "credit_card"
                    ]
                    productDetails[AnalyticsParameterItems] = [guitar]
                    productDetails2[AnalyticsParameterItems] = [guitar2]
                    Analytics.logEvent("ecommerce_purchase", parameters: productDetails)
                    Analytics.logEvent("purchase", parameters: productDetails2)
                }) {
                    Text("click me")
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
