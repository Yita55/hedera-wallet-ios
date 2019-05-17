//
//  AppSettings.swift
//  HGCApp
//
//  Created by Surendra  on 24/11/17.
//  Copyright © 2017 HGC. All rights reserved.
//

import UIKit

class AppSettings: NSObject {
    
    public class func setBiometricLoginEnabled(_ enabled:Bool) {
        UserDefaults.standard.set(enabled, forKey: "bioMetricLoginEnabled")
        UserDefaults.standard.synchronize()
    }
    
    public class func isBiometricLoginEnabled() -> Bool {
        return UserDefaults.standard.bool(forKey: "bioMetricLoginEnabled")
    }
    
    public class func setPrefPaymentConfirmation(_ enabled:Bool) {
        UserDefaults.standard.set(enabled, forKey: "PrefPaymentConfirmationNotification")
        UserDefaults.standard.synchronize()
    }
    
    public class func getPrefPaymentConfirmation() -> Bool {
        return UserDefaults.standard.bool(forKey: "PrefPaymentConfirmationNotification")
    }
    
    public class func setPrefReceiveConfirmation(_ enabled:Bool) {
        UserDefaults.standard.set(enabled, forKey: "PrefReceiveFundsNotification")
        UserDefaults.standard.synchronize()
    }
    
    public class func getPrefReceiveConfirmation() -> Bool {
        return UserDefaults.standard.bool(forKey: "PrefReceiveFundsNotification")
    }
    
    public class func setAppUserName(_ name:String) {
        UserDefaults.standard.set(name, forKey: "AppUserName")
        UserDefaults.standard.synchronize()
    }
    
    public class func getAppUserName() -> String? {
        return UserDefaults.standard.string(forKey: "AppUserName")
    }
    
    public class func setRedirectURL(_ url:String) {
        UserDefaults.standard.set(url, forKey: "RedirectURL")
        UserDefaults.standard.synchronize()
    }
    
    public class func getRedirectURL() -> String? {
        return UserDefaults.standard.string(forKey: "RedirectURL")
    }
    
    public class func setBranchParams(_ params:[String:Any]) {
        UserDefaults.standard.set(params, forKey: "BranchParams")
        UserDefaults.standard.synchronize()
    }
    
    public class func getBranchParams() -> [String: Any]? {
        return UserDefaults.standard.dictionary(forKey: "BranchParams")
    }

    public class func askedForQueryCostWarning() -> Bool {
        return UserDefaults.standard.bool(forKey: "AskedForQueryCostWarning")
    }
        
    public class func setAskedForQueryCostWarning(_ enable:Bool) {
        UserDefaults.standard.set(enable, forKey: "AskedForQueryCostWarning")
        UserDefaults.standard.synchronize()
    }
    
    public class func hasShownBip39Mnemonic() -> Bool {
        return UserDefaults.standard.bool(forKey: "HasShownBip39Mnemonic")
    }
    
    public class func setHasShownBip39Mnemonic() {
        UserDefaults.standard.set(true, forKey: "HasShownBip39Mnemonic")
        UserDefaults.standard.synchronize()
    }
}
