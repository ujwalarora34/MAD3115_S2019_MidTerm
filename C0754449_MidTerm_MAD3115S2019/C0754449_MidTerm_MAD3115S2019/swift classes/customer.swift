//
//  customer.swift
//  C0754449_MidTerm_MAD3115S2019
//
//  Created by MacStudent on 2019-07-12.
//  Copyright © 2019 MacStudent. All rights reserved.
//

import Foundation


class Customer
{
    static var activeCustomer = Customer()
    var customerId : String
    var firstName : String
    var lastName: String
    
    var fullName: String // computed variable
    {
        return "\(self.firstName) \(self.lastName)"
    }
    var email: String
    
    var billDictionary = [Int:Bill]()
    
    var TotalAmountToPay: Float // computed variable
    {
        var TotalAmount: Float = 0.0
        
        for bill in billDictionary
        {
            TotalAmount = TotalAmount + bill.value.totalBillAmount
        }
        return TotalAmount
    }
    init(){
        self.customerId = String()
        self.firstName = String()
        self.lastName = String()
        self.email = String()
    }
    init(customerId: String, firstName: String, lastName: String, email: String)
    {
        self.customerId = customerId
        self.firstName = firstName
        self.lastName = lastName
        self.email = email
    }
}
