//
//  AppDelegate.swift
//  Siren
//
//  Created by Arthur Sabintsev on 1/3/15.
//  Copyright (c) 2015 Sabintsev iOS Projects. All rights reserved.
//

import UIKit

extension AppDelegate: SirenDelegate
{
    func sirenDidShowUpdateDialog() {
        print("sirenDidShowUpdateDialog")
    }

    func sirenUserDidCancel() {
        print("sirenUserDidCancel")
    }

    func sirenUserDidSkipVersion() {
        print("sirenUserDidSkipVersion")
    }

    func sirenUserDidLaunchAppStore() {
        print("sirenUserDidLaunchAppStore")
        exit(0)
    }

}

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
        siren.enterpriseDownloadURL = /* enter link to plist for your enterprise app here */
        siren.enterpriseVersionURL =/* enter link to json file that shows current version here */
        
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

