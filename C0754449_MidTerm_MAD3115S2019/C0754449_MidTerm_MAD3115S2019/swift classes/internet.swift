//
//  internet.swift
//  C0754449_MidTerm_MAD3115S2019
//
//  Created by MacStudent on 2019-07-12.
//  Copyright © 2019 MacStudent. All rights reserved.
//

import Foundation

class Internet: Bill
{
    var providerName: String
    var internetUsed: Int
    
    init(Id: Int, billDate: Date, billType: billTypes, totalBillAmount: Float, providerName: String, internetUsed: Int)
    {
        self.providerName = providerName
        self.internetUsed = internetUsed
        
        super.init(Id: Id, billDate: billDate, billType: billType, totalBillAmount: totalBillAmount)
    }
}
