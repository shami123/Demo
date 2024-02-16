

import UIKit
import SafariServices

class SignUpVC: UIViewController {

    @IBOutlet weak var passTF: UITextField!
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var lNameTF: UITextField!
    @IBOutlet weak var fNameTF: UITextField!
    @IBOutlet weak var agreeBtn: UIButton!
    lazy var regisViewModel: RegistrationVM = {
        return RegistrationVM()
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    func showTutorial() {
        if let url = URL(string: "https://google.com") {
            let config = SFSafariViewController.Configuration()
            config.entersReaderIfAvailable = true

            let vc = SFSafariViewController(url: url, configuration: config)
            present(vc, animated: true)
        }
    }
    func initVM()
    {
        regisViewModel.reloadData = { [weak self] () in
                   DispatchQueue.main.async {
//self?.navigationController?.popViewController(animated: true)
            }
        }}
    @IBAction func termsAction(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        self.showTutorial()
    }
    @IBAction func agreeBtnAction(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        
    }
    @IBAction func signUPAction(_ sender: Any) {
        
        self.checkNilValues()
    }
    @IBAction func signINAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    func checkNilValues()
        {
            if fNameTF.text == ""
            {
                
                Helper.showError("Please enter the first name", self.view)
return

            }
            if lNameTF.text == ""
                   {
                    Helper.showError("Please enter the last name", self.view)
return

                   }
            if emailTF.text == ""
                   {
                    Helper.showError("Please enter the email", self.view)

return
                   }
            if passTF.text == ""
                   {
                    Helper.showError("Please enter the password", self.view)

return
                   }
            if (emailTF.text?.isValidEmail() == false)
                {
                    Helper.showError(Messages.KInvalidEmail, self.view)
return

                }
            if agreeBtn.isSelected == false
            {
                Helper.showError("Please accept terms of services", self.view)
return
            }
            else
            {
                var finalDic = [String:Any?]()
                           //                    user_id,email,password,countryUser,countryCode,firstName,lastName,StreetName,HouseNumber,PostCode,City,location,Country,Industry,Occupation,birthCity,citizenship,place,tax,gender,dob
                finalDic = [ "first_name" : fNameTF.text ?? "" , "last_name" : lNameTF.text ?? ""
                ,"password" : passTF.text ?? "","email" : emailTF.text ?? ""]
                self.regisViewModel.registerAPI(info: finalDic as [String : Any])
                
//                self.initVM()

//                self.localSetup()
//                let storyboard = UIStoryboard(name: "Main", bundle: nil)
//                let vc = storyboard.instantiateViewController(withIdentifier: "Screen2VC") as! Screen2VC
//    //            let default1 = UserDefaults.standard
//    //            default1.set(true, forKey: "Register")
//    self.navigationController?.pushViewController(vc,
//                 animated: true)
            }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    }
}
