//
//  customerlistViewController.swift
//  C0754449_MidTerm_MAD3115S2019
//
//  Created by MacStudent on 2019-07-12.
//  Copyright © 2019 MacStudent. All rights reserved.
//

import UIKit

class CustomerListViewController: UIViewController,UITableViewDelegate , UITableViewDataSource {
    
    
    var customerList = [UsersStruct]()
    var customerArray = Array<Customer>()
    @IBOutlet weak var tbl_users: UITableView!
    
    @IBAction func btn_logout(_ sender: Any)
    {
        self.performSegue(withIdentifier: "LogoutS", sender: nil)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        readCustomersPlistFile()
        
        
        let b1: Mobile = Mobile(Id: 1, billDate: Date(), billType: billTypes.Mobile, totalBillAmount: 55.36, mobileManufacturer: "IPHONE X", planName: "Talk + Data", mobileNumber: "+8554551125", internetUsed: 85, minuteUsed: 96)
        let b2: Mobile = Mobile(Id: 2, billDate: Date(), billType: billTypes.Mobile, totalBillAmount:593.0, mobileManufacturer: "huwaei", planName: "LTE+3G 9.5GB Promo plan", mobileNumber: "+9876543210", internetUsed: 54, minuteUsed: 25)
        
        let b3: Internet = Internet(Id: 1, billDate: Date(), billType: billTypes.Internet, totalBillAmount: 23.09, providerName: "Virgin", internetUsed: 34)
        let b4: Internet = Internet(Id: 2, billDate: Date(), billType: billTypes.Internet, totalBillAmount: 236.09, providerName: "Bell", internetUsed: 765)
        
        let b5: Hydro = Hydro(Id: 1, billDate: Date(), billType: billTypes.Hydro, totalBillAmount: 765.98, agencyName: "HYDRO SUN", unitconsumed: 56)
        let b6: Hydro = Hydro(Id: 2, billDate: Date(), billType: billTypes.Hydro, totalBillAmount: 476.8, agencyName: "WELLNESS", unitconsumed: 98)
        
        //Creating Customer Objects
        
        let cust1: Customer = Customer(customerId: "1", firstName: "vijay", lastName: "malya", email: "vijaymalya@gmail.com")
        
        cust1.billDictionary[1] = b1
        cust1.billDictionary[2] = b3
        
        let cust2: Customer = Customer(customerId: "2", firstName: "mukesh", lastName: "ambani", email: "mukeshambani@gmail.com")
        
        cust2.billDictionary[1] = b2
        cust2.billDictionary[2] = b6
        cust2.billDictionary[3] = b5
        
        let cust3: Customer = Customer(customerId: "3", firstName: "ujwal", lastName: "arora", email: "ujwalarora@gmail.com")
        
        cust3.billDictionary[1] = b4
        
        
        let cust4: Customer = Customer(customerId: "4", firstName: "neeta", lastName: "ambani", email: "neetaambani@gmail.com")
        
        cust4.billDictionary[1] = b3
        
        
        let cust5: Customer = Customer(customerId: "5", firstName: "arnold", lastName: "schwanger", email: "arnoldschwanger@gmail.com")
        
        cust5.billDictionary[1] = b6
        
        customerArray = [cust1, cust2, cust3, cust4, cust5]
        self.tbl_users.delegate = self
        self.tbl_users.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    
    func readCustomersPlistFile(){
        
        let plist = Bundle.main.path(forResource: "UserInfo", ofType: "plist")
        
        if let dict = NSMutableDictionary(contentsOfFile: plist!){
            if let customers = dict["Users"] as? [[String:Any]]
            {
                for customer in customers {
                    let id = customer["userID"] as! Int
                    let firstName = customer["userName"] as! String
                    
                    let email = customer["email"] as! String
                    let password = customer["password"] as! String
                    
                    self.customerList.append(UsersStruct(userID: id, userName: firstName, email: email, password: password))
                }
            }
        }
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return customerArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "usersCell")  as! UITableViewCell
        
        cell.textLabel?.text = self.customerArray[indexPath.row].fullName
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.tapBtnAction(_:)))
        cell.tag = indexPath.row
        cell.addGestureRecognizer(tapGesture)
        return cell
    }
    
    @objc func tapBtnAction(_ sender: UITapGestureRecognizer) {
        print(sender.view!.tag)
        Customer.activeCustomer = self.customerArray[(sender.view?.tag)!]
        self.performSegue(withIdentifier: "GoToDetailS", sender: self)
    }
    
}
