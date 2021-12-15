//
//  ViewController.swift
//  userdefaultslogin
//
//  Created by Macintosh on 15.12.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var txtUsername: UITextField! // Kullanıcı Adı
    @IBOutlet weak var txtPassword: UITextField! // Şifre
    
    override func viewDidLoad() {
        super.viewDidLoad()
 
        let girisDetay = UserDefaults.standard.value(forKey: "kullanici_adi")
        if girisDetay != nil {
            txtUsername.text = UserDefaults.standard.value(forKey: "kullanici_adi") as? String
            txtPassword.text = UserDefaults.standard.value(forKey: "sifre") as? String
       
        }
    }
    


    @IBAction func btnGirisYap(_ sender: Any) {

        let alert = UIAlertController(title: "Kaydet", message: "Kaydetmek İstediğinden Emin Misin ?", preferredStyle: .alert)
        
        let evetButonu = UIAlertAction(title: "Evet", style: .default){ (action) in
            UserDefaults.standard.set(self.txtUsername.text!,forKey: "kullanici_adi")
            UserDefaults.standard.set(self.txtPassword.text!,forKey: "sifre")
            self.performSegue(withIdentifier: "toSegue", sender: self)
        }
        
        let hayirButonu = UIAlertAction(title: "Hayır", style: .default){action in
            print("Herhangi Bir Bilgi Kayıt Etmedin")
            self.performSegue(withIdentifier: "toSegue", sender: self)
        }
        
        alert.addAction(evetButonu)
        alert.addAction(hayirButonu)
        present(alert,animated: true,completion: nil)
    }
    
    
    // Yönlendirme
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toSegue"
        {
            let gidilecekVC = segue.destination as! GirisEkrani
            gidilecekVC.userpass = "Hoşgeldin \(txtUsername.text!)"
        }
    }
}

