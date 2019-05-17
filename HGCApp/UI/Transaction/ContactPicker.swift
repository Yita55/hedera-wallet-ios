//
//  ContactPicker.swift
//  HGCApp
//
//  Created by Surendra  on 12/12/17.
//  Copyright © 2017 HGC. All rights reserved.
//

import UIKit

protocol ContactPickerDelegate : class {
    func contactPickerDidPickContact(_ picker:ContactPicker, contact: HGCContact)
    func contactPickerDidPickAccount(_ picker:ContactPicker, account: HGCAccount)
}

class ContactPicker : UIViewController {
    
    private static let sectionIndexContacts = 0
    private static let sectionIndexMyAccounts = 1
    
    @IBOutlet weak var tableView : UITableView!
    @IBOutlet weak var addButton : UIButton!
    weak var delegate: ContactPickerDelegate?
    
    private var contacts  = [HGCContact]()
    
    var pickeMode  = true
    
    static func getInstance() -> ContactPicker {
        return Globals.mainStoryboard().instantiateViewController(withIdentifier: "contactPicker") as! ContactPicker
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.tableFooterView = UIView.init()
        self.navigationItem.hidesBackButton = true
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(image: UIImage.init(named: "icon-close"), style: .plain, target: self, action: #selector(onCloseButtonTap))
        
        self.tableView.estimatedRowHeight = 100
        self.tableView.rowHeight = UITableView.automaticDimension
    }
    
    func allAccounts() -> [HGCAccount] {
        return HGCWallet.masterWallet()?.allAccounts() ?? []
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.contacts = HGCContact.getAllContacts()
        self.title = self.contacts.count == 0 ? NSLocalizedString("NO CONTACTS", comment: "") : NSLocalizedString("EXISTING CONTACTS", comment: "")
        self.tableView.reloadData()
    }
    
    @IBAction func onCloseButtonTap() {
        self.navigationController?.popViewController(animated: true)
    }
}

extension ContactPicker : UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == ContactPicker.sectionIndexContacts {
            return contacts.count
            
        } else if section == ContactPicker.sectionIndexMyAccounts {
            return self.allAccounts().count
        }
        
        return 0
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == ContactPicker.sectionIndexContacts {
            return nil
            
        } else if section == ContactPicker.sectionIndexMyAccounts && self.allAccounts().count > 0{
            return NSLocalizedString("My Accounts", comment: "")
        }
        return nil
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ContactTableViewCell", for: indexPath) as! ContactTableViewCell
        if indexPath.section == ContactPicker.sectionIndexContacts {
            let contact = self.contacts[indexPath.row]
            
            cell.verifiedLabel.text = contact.verified ? "" : NSLocalizedString("unverified", comment: "")
            cell.nameLabel.text = (contact.name == nil || (contact.name?.trim().isEmpty)! ) ? NSLocalizedString("UNKNOWN", comment: "") : contact.name
            cell.addressLabel.text = contact.publicKeyID ?? ""
            
        } else if indexPath.section == ContactPicker.sectionIndexMyAccounts {
            let account = self.allAccounts()[indexPath.row]
            cell.verifiedLabel.text = ""
            cell.nameLabel.text = account.name
            cell.addressLabel.text = account.accountID()?.stringRepresentation() ?? account.publicKeyString()
        }
       
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if self.pickeMode {
            if indexPath.section == ContactPicker.sectionIndexContacts {
                let contact = self.contacts[indexPath.row]
                self.delegate?.contactPickerDidPickContact(self, contact: contact)
                
            } else if indexPath.section == ContactPicker.sectionIndexMyAccounts {
                let account = self.allAccounts()[indexPath.row]
                self.delegate?.contactPickerDidPickAccount(self, account: account)
            }
        }
    }
}
