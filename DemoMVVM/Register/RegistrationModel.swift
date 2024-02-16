//
//  RegistrationModel.swift
//  Folgory
//
//  Created by Shami Kapoor on 13/05/19.
//  Copyright © 2019 Folgory. All rights reserved.
//

import UIKit

class RegistrationModel: NSObject {
    public var country : String?
    public var firstName : String?
    public var lastName : String?
    public var dob : String?
    public var email : String?
    public var address : String?
    public var street : String?
    public var houseNumber : String?
    public var postCode : String?
    public var city : String?
    public var mobileNumber : String?
    public var password : String?
    public var promotionalInviteCode : String?
    public var industry : String?
    public var occupation : String?
    public var gender : String?
    public var cityOfBirth : String?
    public var citizenShip : String?
    public var checkCountryTax : String?
    public var termAccept :  String?
    public var countryAddress :  String?
    public var fullDOB :  String?


    public class func modelsFromDictionaryArray(array:[Any]) -> [RegistrationModel]
    {
        var models:[RegistrationModel] = []
        for item in array
        {
            models.append(RegistrationModel(dictionary: item as! [String : Any])!)
        }
        return models
    }
    
    
    required public init?(dictionary: [String : Any])  {
        
        country = dictionary["country"] as? String
        firstName = dictionary["firstName"] as? String
        lastName = dictionary["lastName"] as? String
        dob = dictionary["dob"] as? String
        email = dictionary["email"] as? String
        address = dictionary["address"] as? String
        street = dictionary["street"] as? String
        houseNumber = dictionary["houseNumber"] as? String
        postCode = dictionary["postCode"] as? String
        city = dictionary["city"] as? String
        mobileNumber = dictionary["mobileNumber"] as? String
        password = dictionary["password"] as? String
        promotionalInviteCode = dictionary["promotionalInviteCode"] as? String
        industry = dictionary["industry"] as? String
        occupation = dictionary["occupation"] as? String
        gender = dictionary["gender"] as? String
        countryAddress = dictionary["countryAddress"] as? String
        cityOfBirth = dictionary["cityOfBirth"] as? String
        citizenShip = dictionary["citizenShip"] as? String
        checkCountryTax = dictionary["checkCountryTax"] as? String
        termAccept = dictionary["termAccept"] as? String
        fullDOB = dictionary["fullDOB"] as? String

    }
}
