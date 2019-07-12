//
//  bill.swift
//  C0754449_MidTerm_MAD3115S2019
//
//  Created by MacStudent on 2019-07-12.
//  Copyright © 2019 MacStudent. All rights reserved.
//

import Foundation

enum billTypes {
    case Mobile, Internet, Hydro, None
}

class Bill
{
    var Id: Int
    var billDate: Date
    var billType: billTypes
    var totalBillAmount: Float
    
    init()
    {
        self.Id = Int()
        self.billDate = Date()
        self.billType = billTypes.None
        self.totalBillAmount = Float()
    }
    
    init(Id: Int, billDate: Date, billType: billTypes, totalBillAmount: Float)
    {
        self.Id = Id
        self.billDate = billDate
        self.billType = billType
        self.totalBillAmount = totalBillAmount
    }
}
