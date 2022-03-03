//
//  ViewController.swift
//  BirthdayNoteTaker
//
//  Created by L60809MAC on 15.02.2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField! // kullanıcının adını girdiği textField
    @IBOutlet weak var birthdayTextField: UITextField!  // kullanıcının doğum gününü girdiği textField
    @IBOutlet weak var nameLabel: UILabel!  // kullanıcı adının görüneceği label
    @IBOutlet weak var birthdayLabel: UILabel!  // doğum tarihinin görüneceği label
    
    override func viewDidLoad() { // app açılınca ilk olacak şey
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // --------------- Veri Kaydetme ------------------------
//        Casting -------  as? (yapabilirsen belirtilen biçimde kaydet) ------- as! fore casting (her halükarda, zorla gösterilen şekilde kaydet demek)
        
        let storedName = UserDefaults.standard.object(forKey: "name") // app tekrar açıldığında kaydedilen ismi çağırdık
        let storedBirthday = UserDefaults.standard.object(forKey: "birthday") // app tekrar açıldığında kaydedilen tarihi çağırdık
        
        if let newName = storedName as? String { // storedName i alıp String olarak kaydedebilirsen eğer newName diye değişken oluştur
            nameLabel.text = "Name: \(newName)"  // nameLabel da newName in değerini göster
        }
        
        if let newBirthday = storedBirthday as? String { // storedBirthday i alıp String olarak kaydedebilirsen newBirthday adında değişken oluştur
            birthdayLabel.text = "Birthday: \(newBirthday)" // birthdayLabel da newBirthday in değerini göster
        }
        
    }

    @IBAction func saveClicked(_ sender: Any) { // Kaydet butonu
        
//        UserDefaults // Küçük verileri (anahtar kelime ve değer) kaydedebildiğimiz bir veritabanı
        
        UserDefaults.standard.set(nameTextField.text!, forKey: "name") //.standard (defauld bir obje döndürüyor, .standard ile bu sınıftaki objeye erişebiliyoruz ve bu obje her yerde aynı 'Let myString = ""' gibi)
//        .set kaydetmek istediğin değer ile kaydetmek istediğin anahtar kalimeyi istiyor, kaydedilecek değere kullanıcının girdiği ismi verdik, anahtar kelimeye de hatırlayabileceğimiz bir şey yazdık: çağırırken aynı anahtar kelimeyi kullanacağız
        
        UserDefaults.standard.set(birthdayTextField.text, forKey: "birthday") // burada da kullanıcının girdiği doğum tarihini kaydettik
//        UserDefaults.standard.synchronize() // önceden bu kodda kullanılıyordu, kaydettikten sonra senkronize ediyordu; artık bu kullanılmıyor, gerek yok
        
        nameLabel.text = "Name: \(nameTextField.text!)" // metin ortasında değişken kullanımı bu şekilde
        birthdayLabel.text = "Birthday: \(birthdayTextField.text!)" // sonuna ünlem koyarak text olacağını belirttik
    }
    
    @IBAction func deleteClicked(_ sender: Any) {
        
        // ---------- Veri Silme ------------
        // UserDefaults (veri tabanından) dan veri silme işlemi yapacağız
        
        let storedName = UserDefaults.standard.object(forKey: "name")
        let storedBirthday = UserDefaults.standard.object(forKey: "birthday")
        
        if (storedName as? String) != nil { // eğer storedName in String e çevrilmiş hali boş değilse, kayıtlı bir değer varsa aşağıda ki işlemi yap
            UserDefaults.standard.removeObject(forKey: "name") // name (Kayıtlı olan ismi) i sil
            nameLabel.text = "Name: "
        }
        
        if (storedBirthday as? String) != nil { // doğum tarihi boş değilse, bir değer varsa aşağıdaki işlemi yap
            UserDefaults.standard.removeObject(forKey: "birthday") // birthday (Kayıtlı tarih) i sil
            birthdayLabel.text = "Birthday: "
        }
        
    }
    

}

