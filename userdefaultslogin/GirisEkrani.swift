//
//  GirisEkrani.swift
//  userdefaultslogin
//
//  Created by Macintosh on 15.12.2021.
//

import UIKit

class GirisEkrani: UIViewController {

    @IBOutlet weak var lblHosgeldin: UILabel!

    var userpass:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblHosgeldin.text = userpass

    }
    


    
}
