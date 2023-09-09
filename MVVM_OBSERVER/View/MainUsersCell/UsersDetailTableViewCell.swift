//
//  UsersDetailTableViewCell.swift
//  MVVM_OBSERVER
//
//  Created by Syed Abdul Ahad on 08/09/2023.
//

import UIKit

class UsersDetailTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var user_name: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var phoneNumber: UILabel!
    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var website: UILabel!
    
    @IBOutlet weak var street: UILabel!
    @IBOutlet weak var suite: UILabel!
    @IBOutlet weak var city: UILabel!
    @IBOutlet weak var zipCode: UILabel!
    
    @IBOutlet weak var companyName: UILabel!
    @IBOutlet weak var catchPhrase: UILabel!
    @IBOutlet weak var bs: UILabel!
    
    
    var data : GetUserProfile!{
        didSet{
            self.user_name.text = self.data.username
            self.name.text = self.data.name
            self.phoneNumber.text = self.data.phone
            self.email.text = self.data.email
            self.website.text = self.data.website
            
            self.street.text = self.data.address.street
            self.suite.text = self.data.address.suite
            self.city.text = self.data.address.city
            self.zipCode.text = self.data.address.zipcode
            
            self.companyName.text = self.data.company.name
            self.catchPhrase.text = self.data.company.catchPhrase
            self.bs.text = self.data.company.bs
        }
    }
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
