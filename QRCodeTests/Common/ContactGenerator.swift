//
//  ContactGenerator.swift
//  QRCodeTests
//
//  Created by Pienaar Anker on 2021/02/01.
//

import Foundation
import Contacts
import UIKit

class ContactGenerator {
    
    static func generateBasicContact() -> CNContact {
        let contact = CNMutableContact()
        contact.givenName = "Sam"
        contact.middleName = "George"
        contact.familyName = "Stevenson"
        contact.phoneNumbers = [CNLabeledValue<CNPhoneNumber>(label: nil, value: CNPhoneNumber(stringValue: "(073) 954 6625")),
                                CNLabeledValue<CNPhoneNumber>(label: nil, value: CNPhoneNumber(stringValue: "(074) 254 1102"))]
        return contact
    }
    
    static func generateContactWithGivenAndFamilyName() -> CNContact {
        let contact = CNMutableContact()
        contact.givenName = "Sam"
        contact.familyName = "Stevenson"
        contact.phoneNumbers = [CNLabeledValue<CNPhoneNumber>(label: nil, value: CNPhoneNumber(stringValue: "(073) 954 6625"))]
        return contact
    }
    
    static func generateContactWithGivenAndMiddleName() -> CNContact {
        let contact = CNMutableContact()
        contact.givenName = "Sam"
        contact.middleName = "George"
        contact.phoneNumbers = [CNLabeledValue<CNPhoneNumber>(label: nil, value: CNPhoneNumber(stringValue: "(073) 954 6625"))]
        return contact
    }
    
    static func generateContactWithOlnyGivenName() -> CNContact {
        let contact = CNMutableContact()
        contact.givenName = "Sam"
        contact.phoneNumbers = [CNLabeledValue<CNPhoneNumber>(label: nil, value: CNPhoneNumber(stringValue: "(073) 954 6625"))]
        return contact
    }
    
    static func generateContactWithImage() -> CNContact {
        let contact = CNMutableContact()
        contact.givenName = "Sam"
        contact.phoneNumbers = [CNLabeledValue<CNPhoneNumber>(label: nil, value: CNPhoneNumber(stringValue: "(073) 954 6625"))]
        contact.imageData = UIImage(named: "splashQRCode")?.pngData()
        return contact
    }
}
