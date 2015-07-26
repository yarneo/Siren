//
//  AppDelegate.swift
//  Siren
//
//  Created by Arthur Sabintsev on 1/3/15.
//  Copyright (c) 2015 Sabintsev iOS Projects. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        window?.makeKeyAndVisible()
        
        setupSiren()

        return true
    }
    
    func setupSiren() {
        
        let siren = Siren.sharedInstance
        
        // Required
        siren.isEnterpriseVersion = true
        siren.enterpriseDownloadURL = "link_to_app"
        siren.enterpriseVersionURL = "link_to_version"
        
        // Optional
        siren.delegate = self
        
        // Optional
        siren.debugEnabled = true;
        
        // Optional - Defaults to .Option
//        siren.alertType = .Option
        
        // Optional - Can set differentiated Alerts for Major, Minor, Patch, and Revision Updates
        siren.majorUpdateAlertType = .Option
        siren.minorUpdateAlertType = .Option
        siren.patchUpdateAlertType = .Option
        siren.revisionUpdateAlertType = .Option
        
        // Optional - Sets all messages to appear in Spanish. Siren supports many other languages, not just English and Spanish.
//        siren.forceLanguageLocalization = .Spanish
        
        // Required
        siren.checkVersion(.Immediately)
    }
}

extension AppDelegate: SirenDelegate
{
    func sirenDidShowUpdateDialog() {
        println("sirenDidShowUpdateDialog")
    }
    
    func sirenUserDidCancel() {
        println("sirenUserDidCancel")
    }
    
    func sirenUserDidSkipVersion() {
        println("sirenUserDidSkipVersion")
    }
    
    func sirenUserDidLaunchAppStore() {
        println("sirenUserDidLaunchAppStore")
    }
    
    /**
        This delegate method is only hit when alertType is initialized to .None
    */
    func sirenDidDetectNewVersionWithoutAlert(message: String) {
        println("\(message)")
    }
}