//
//  ViewController.swift
//  Passra1n
//
//  Created by Always Apple FTD on 3/15/24.
//

//import Cocoa
import SwiftUI
import Foundation
import AppKit

class ViewController: NSViewController {
    
    @IBAction func toolSetupButtonPressed(_ sender: NSButton) {
        let alert1 = NSAlert()
        alert1.messageText = "This will run a script to install any dependencies."
        alert1.informativeText = "It may take several minutes."
        alert1.addButton(withTitle: "OK")
        alert1.addButton(withTitle: "Cancel")
        let response = alert1.runModal()
        if response == .alertFirstButtonReturn {
           // self.autoSSH()
           // self.backupPasscode()
            guard let resourcePath = Bundle.main.resourcePath else {
                print("Failed to find the main bundle's resource path")
                return
            }
            
            let scriptPath = "\(resourcePath)/setup_passra1n.sh"
            
            let process1 = Process()
            process1.executableURL = URL(fileURLWithPath: "/bin/sh")
            process1.arguments = [scriptPath]
            
            //let process2 = Process()
            //process2.executableURL = URL(fileURLWithPath: "/bin/sh")
            //process2.arguments = ["-c", "sudo -v"]

            do {
                try process1.run()
                process1.waitUntilExit()
                
                //sleep(2)
                
                //try process2.run()
                //process2.waitUntilExit()
            } catch {
                print("Failed to run commands: \(error)")
            }
            
            
            // if let resourcesPath = defineResourcesDirectory() {
                //let output1 = runTerminalCommand("bash \(resourcesPath)/setup_passra1n.sh")
                //print(output1)
                print("Dependencies Script ran!")
                let alert2 = NSAlert()
                alert2.messageText = "Done!"
                alert2.informativeText = "Passra1n should now be set up and ready to go.\n\nYou only need to use this button once.\n\nWhen bypassing again, don't use this button again."
                alert2.addButton(withTitle: "OK")
                // alert2.addButton(withTitle: "Cancel")
                alert2.runModal()
                // return output1 // Assuming you want to return the output of the terminal command.
            //} else {
                // Handle the case where the resources directory could not be found (unlikely in this scenario)
               //print("Resources directory not found.")
                //return
            //}
            
            
        } else if response == .alertSecondButtonReturn {
            
        }
    }
    
    @IBAction func jailbreakButtonPressed(_ sender: NSButton) {
        let alert1 = NSAlert()
        alert1.messageText = "Jailbreak device?"
        // alert1.informativeText = "You will need to enter DFU mode, so look up how to for your model now if you don't know how to."
        alert1.informativeText = "You will also need to enter DFU mode, so you can follow the instructions in the jailbreak app."
        alert1.addButton(withTitle: "Open Checkra1n (Built in to this app)")
        alert1.addButton(withTitle: "Already Done Jailbreak")
        alert1.addButton(withTitle: "Cancel")
        let response = alert1.runModal()
        if response == .alertFirstButtonReturn {
           // self.AutomaticallySSHConnection()
           // self.backupPasscodeFiles()
            //let alert2 = NSAlert()
            //alert2.messageText = "Please enter DFU Mode on your device!"
            //alert2.informativeText = "Once done, click OK to continue with jailbreak."
            //alert2.addButton(withTitle: "OK")
            // alert2.addButton(withTitle: "Cancel")
            //alert2.runModal()
            
            //print("Running checkra1n executable...")
            //sleep(2)
            
            guard let resourcesPath = Bundle.main.resourcePath else {
                print("Failed to find the main bundle's resource path")
                return
            }

            let command1 = "chmod +x \(resourcesPath)/checkra1n.app/Contents/MacOS/checkra1n"
            let command2 = "xattr -cr \(resourcesPath)/checkra1n.app"
            let command3 = "open \(resourcesPath)/checkra1n.app"

            let process1 = Process()
            process1.executableURL = URL(fileURLWithPath: "/bin/sh")
            process1.arguments = ["-c", command1]

            let process2 = Process()
            process2.executableURL = URL(fileURLWithPath: "/bin/sh")
            process2.arguments = ["-c", command2]

            let process3 = Process()
            process3.executableURL = URL(fileURLWithPath: "/bin/sh")
            process3.arguments = ["-c", command3]

            do {
                try process1.run()
                process1.waitUntilExit()

                try process2.run()
                process2.waitUntilExit()

                try process3.run()
                process3.waitUntilExit()
            } catch {
                print("Failed to run commands: \(error)")
            }
            
            //if let resourcesPath = defineResourcesDirectory() {
                //let output1 = runTerminalCommand("chmod +x \(resourcesPath)/jailbreak/* && xattr -cr \(resourcesPath)/jailbreak/*")
                //let output1 = runTerminalCommand("chmod +x \(resourcesPath)/checkra1n.app/Contents/MacOS/checkra1n && xattr -cr \(resourcesPath)/checkra1n.app")
                //print(output1)
                sleep(1)
                // let output2 = runTerminalCommand("\(resourcesPath)/jailbreak/checkra1n -c -V -E")
                //let output2 = runTerminalCommand("open \(resourcesPath)/checkra1n.app")
                //print(output2)
                
                let alert2 = NSAlert()
                alert2.messageText = "Did the jailbreak complete successfully and say 'All Done'?"
                // alert1.informativeText = "You will need to enter DFU mode, so look up how to for your model now if you don't know how to."
                alert2.informativeText = ""
                alert2.addButton(withTitle: "Yes")
                alert2.addButton(withTitle: "No")
                let response2 = alert2.runModal()
                if response2 == .alertFirstButtonReturn {
                    bypassDeviceButton.isEnabled = true
                    deactivateButton.isEnabled = true
                    let alert4 = NSAlert()
                    alert4.messageText = "Yay!"
                    alert4.informativeText = "You can now move on to bypassing your device!"
                    alert4.addButton(withTitle: "OK")
                    // alert2.addButton(withTitle: "Cancel")
                    alert4.runModal()
                } else if response2 == .alertSecondButtonReturn {
                    print("ERROR: You cannot continue without a jailbreak!")
                    let alert3 = NSAlert()
                    alert3.messageText = "Sorry! You cannot continue without a jailbreak!"
                    alert1.informativeText = "Try jailbreaking again with checkra1n. If it still fails, make sure you are bypassing with iOS 12.0 - 14.5.1! For iOS 14.6 - 14.8.1 click the 'Options' button in the checkra1n app and check the 'Allow untested iOS/iPadOS/tvOS versions'. Then go back and try again."
                    alert3.addButton(withTitle: "OK")
                    // alert2.addButton(withTitle: "Cancel")
                    alert3.runModal()
                    return
                }
                
            //} else {
                // Handle the case where the resources directory could not be found (unlikely in this scenario)
                //print("Resources directory not found.")
                //return
            //}
            
            
            // runiDeviceInfoCommandUntilNoError { output in
                // This block will be executed once runiDeviceInfoCommandUntilNoError completes.
                // 'output' contains the result from the function.
                // print("Received output: \(output)")
            // }
            // sleep(1)
            // print("Device Detected! Finishing Jailbreak...")
            // sleep(8)

            // self.runCheckra1nForFiveSeconds {
                // print("Jailbreak Ran!")
                // DispatchQueue.main.async {
                    // Now this alert will show after the jailbreaking process is done
                    // let alert3 = NSAlert()
                    // alert3.messageText = "Jailbreak was ran!"
                    // alert3.informativeText = "If successful, then your device should be verbose booting to the Hello screen.\n\nIf the device is stuck on the Apple logo or isn't on at all, then reboot out of DFU manually and try again."
                    // alert3.addButton(withTitle: "OK")
                    // alert3.runModal()
                // }
            // }
            
        } else if response == .alertSecondButtonReturn {
            bypassDeviceButton.isEnabled = true
            deactivateButton.isEnabled = true
            let alert5 = NSAlert()
            alert5.messageText = "Yay!"
            alert5.informativeText = "You can now move on to bypassing your device!"
            alert5.addButton(withTitle: "OK")
            // alert2.addButton(withTitle: "Cancel")
            alert5.runModal()
        }
    }
    
    @IBAction func bypassDeviceButtonPressed(_ sender: NSButton) {
        let alert1 = NSAlert()
        alert1.messageText = "Passra1n will now bypass your device."
        alert1.informativeText = "It may take a few tries to succeed.\n\nNot all macOS versions work the best with iDeviceActivation so please be patient."
        alert1.addButton(withTitle: "OK")
        alert1.addButton(withTitle: "Cancel")
        let response = alert1.runModal()
        if response == .alertFirstButtonReturn {
           // self.autoSSH()
           // self.backupPasscode()
            print("Running bypass script...")
            sleep(1)
            guard let resourcesPath = Bundle.main.resourcePath else {
                print("Failed to find the main bundle's resource path")
                return
            }
            
            //let output1 =
            let output1 = runTerminalCommand("\(resourcesPath)/tools/idevicepair unpair")
            print(output1)
            //print(output1)
            //let output2 =
            let output2 = runTerminalCommand("\(resourcesPath)/tools/idevicepair pair")
            print(output2)
            
            sleep(1)
            
            let alert2 = NSAlert()
            alert2.messageText = "Please press Trust on your device if prompted!"
            alert2.informativeText = "If your connected device is asking to trust the computer, do press Trust now.\nIf not you can ignore this message and click Device is Trusted."
            alert2.addButton(withTitle: "Device is Trusted")
            // alert2.addButton(withTitle: "Cancel")
            alert2.runModal()
            
            // Remove known_hosts file so we don't run into ssh key issue
            let output3 = runTerminalCommand("rm -rf ~/.ssh/known_hosts")
            print(output3)
            
            // Kill iproxy in case its already runnning
            let output4 = runTerminalCommand("cd \(resourcesPath) && killall iproxy")
            print(output4)

            print("Starting iproxy...")

            // Run iproxy in the background
            //let output = runTerminalCommand("cd \(resourcesPath) && ./tools/iproxy 2222:44 > /dev/null 2>&1 &
            let output5 = runTerminalCommand("\(resourcesPath)/tools/iproxy 2222:44 > /dev/null 2>&1 &")
            print(output5)

            sleep(2)
            
            // Mount the filesystem to make modifications
            print("Mounting Filesystems as Read-write...")
            let output6 = runTerminalCommand("cd \(resourcesPath) && ./tools/sshpass -p 'alpine' ssh -o StrictHostKeyChecking=no -p 2222 'root@localhost' 'mount -o rw,union,update /'")
            print(output6)
            print("Mounted!")

            sleep(2)
            
            // Remove old RaptorActivation.pem file
            print("Deleting old RaptorActivation.pem off of device")
            let output7 = runTerminalCommand("cd \(resourcesPath) && ./tools/sshpass -p 'alpine' ssh -o StrictHostKeyChecking=no -p 2222 'root@localhost' 'rm -rf /System/Library/PrivateFrameworks/MobileActivation.framework/Support/Certificates/RaptorActivation.pem'")
            print(output7)

            sleep(2)
            
            // Upload new RaptorActivation.pem file
            print("Injecting new RaptorActivation.pem")
            let output8 = runTerminalCommand("cd \(resourcesPath) && ./tools/sshpass -p 'alpine' ssh -o StrictHostKeyChecking=no -p2222 root@localhost 'dd of=/System/Library/PrivateFrameworks/MobileActivation.framework/Support/Certificates/RaptorActivation.pem' < patches/raptor_activation")
            print(output8)
            print("Injected cert!")

            sleep(3)

            let output9 = runTerminalCommandv2("cd \(resourcesPath) && ./tools/ideviceactivation activate -s https://appletech752.com/server/epicstuff.php -d")
            print(output9)
            
            //Kill iproxy
            let output10 = runTerminalCommand("cd \(resourcesPath) && killall iproxy")
            print(output10)

            print("Activation Payload Ran!")
            
            
            //let output3 =
            //let output = runTerminalCommand("cd \(resourcesPath) && bash ./activate.sh")
            //print(output3)
            //runShellCommand(commandName: "activate.sh", arguments: [""])
            
            //let command3 = "cd \(resourcesPath) && bash ./activate.sh"

            //let process1 = Process()
            //process1.executableURL = URL(fileURLWithPath: "/bin/sh")
            //process1.arguments = ["-c", command1]

            //let process2 = Process()
            //process2.executableURL = URL(fileURLWithPath: "/bin/sh")
            //process2.arguments = ["-c", command2]

            //let process3 = Process()
            //process3.executableURL = URL(fileURLWithPath: "/bin/sh")
            //process3.arguments = ["-c", command3]

            //do {
                //try process1.run()
                //process1.waitUntilExit()

                //try process2.run()
                //process2.waitUntilExit()

                //try process3.run()
                //process3.waitUntilExit()
            //} catch {
                //print("Failed to run commands: \(error)")
            //}
            // if let resourcesPath = defineResourcesDirectory() {
                //let output1 = runTerminalCommand("\(resourcesPath)/tools/idevicepair unpair")
                //print(output1)
                //sleep(2)
                //let output2 = runTerminalCommand("\(resourcesPath)/tools/idevicepair pair")
                //print(output2)
                sleep(1)
                //let output3 = runTerminalCommand("cd \(resourcesPath) && bash ./activate.sh")
                //print(output3)
                sleep(UInt32(1.5))
                // let alert2 = NSAlert()
                // alert2.messageText = "First Step Done!"
                // alert2.informativeText = "Your device was activated tethered.\nTo complete the bypass and make it fully untethered, you will need to complete a few simple steps. Please follow these steps, and click the button below once done.\n\n1. Set up your device.\n2. Open the checkra1n loader (most times on the second screen) and install Cydia.\n3. Once Cydia is installed, open it up and IGNORE all upgrades. This will save time and is not necessary for the bypass to work.\n4. Click the Search icon tab on the far right bottom, tap the Search bar, and search for the package 'Cydia Substrate'. The quotes are only to show the exact name and not confuse you, they are not needed when searching the actual package. \n5. Tap Modify, then Install, and finally, Confirm. The package will install, then click the 'Restart SpringBoard' button when done. If it says any error like 'DPKG_LOCKED' or something like that, DO NOT waste time restarting the SpringBoard! Instead, quit the app (not just close by going home), by opening the App Switcher with all open apps and swiping up to quit Cydia. Open Cydia again, and follow steps 3 - 5. Once you see all the white text, and none of it has errors, restart the SpringBoard.\n\nIMPORTANT: Please only click OK when the device is back on the Lock Screen! If you continue before that, the tool may fail to connect to your device."
                // alert2.addButton(withTitle: "Cydia Substrate is Installed with No Errors")
                // alert2.addButton(withTitle: "Cancel")
                // alert2.runModal()
                
                self.showUntetheredStepsScreen()
                
                // sleep(5)
                // let output4 = runTerminalCommand("cd \(resourcesPath) && bash ./untether.sh")
                // print(output4)
                // print("Activation was attempted!")
                // print("This should normally be successful, but in some cases you may have to try again.")
                // let alert3 = NSAlert()
                // alert3.messageText = "Bypass Done!!"
                // alert3.informativeText = "Try setting up your device!\n\nIf it's still locked, click the 'Bypass Device' button again to try again."
                // alert3.addButton(withTitle: "OK")
                // alert2.addButton(withTitle: "Cancel")
                // alert3.runModal()
                // return output1 // Assuming you want to return the output of the terminal command.
            // } else {
                // Handle the case where the resources directory could not be found (unlikely in this scenario)
                //print("Resources directory not found.")
                //return
            //}
            
            
        } else if response == .alertSecondButtonReturn {
            
        }
    }
    
    @IBAction func deactivateButtonPressed(_ sender: NSButtonCell) {
        let alert1 = NSAlert()
        alert1.messageText = "Passra1n will now re-lock your device."
        alert1.informativeText = "This may take a minute or so."
        alert1.addButton(withTitle: "OK")
        alert1.addButton(withTitle: "Cancel")
        let response = alert1.runModal()
        if response == .alertFirstButtonReturn {
           // self.autoSSH()
           // self.backupPasscode()
            print("Running bypass script...")
            sleep(1)
            guard let resourcesPath = Bundle.main.resourcePath else {
                print("Failed to find the main bundle's resource path")
                return
            }
            let output1 = runTerminalCommand("\(resourcesPath)/tools/idevicepair unpair")
            print(output1)
            let output2 = runTerminalCommand("\(resourcesPath)/tools/idevicepair pair")
            print(output2)
            
            sleep(1)
            
            let alert2 = NSAlert()
            alert2.messageText = "Please press Trust on your device if prompted!"
            alert2.informativeText = "If your connected device is asking to trust the computer, do press Trust now.\nIf not you can ignore this message and click Device is Trusted."
            alert2.addButton(withTitle: "Device is Trusted")
            // alert2.addButton(withTitle: "Cancel")
            alert2.runModal()
            
            // Remove known_hosts file so we don't run into ssh key issue
            let rmknownhostscmd = runTerminalCommand("rm -rf ~/.ssh/known_hosts")
            print(rmknownhostscmd)
            
            // Kill iproxy in case its already runnning
            let output3 = runTerminalCommand("killall iproxy")
            print(output3)
            
            // Run iproxy in the background
            let output4 = runTerminalCommand("\(resourcesPath)/tools/iproxy 2222:44 > /dev/null 2>&1 &")
            print(output4)
            sleep(2)
            print("Mounting Filesystems as Read-write...")
            let output5 = runTerminalCommand("\(resourcesPath)/tools/sshpass -p 'alpine' ssh -o StrictHostKeyChecking=no -p 2222 'root@localhost' 'mount -o rw,union,update /'")
            print(output5)
            print("Mounted!")
            
            // Remove old RaptorActivation.pem file
            print("Deleting old RaptorActivation.pem off of device")
            sleep(1)
            let output6 = runTerminalCommand("\(resourcesPath)/tools/sshpass -p 'alpine' ssh -o StrictHostKeyChecking=no -p 2222 'root@localhost' 'rm -rf /System/Library/PrivateFrameworks/MobileActivation.framework/Support/Certificates/RaptorActivation.pem'")
            print(output6)
            
            sleep(1)
            print("Deleting first dylib and plist...")
            let output7 = runTerminalCommand("\(resourcesPath)/tools/sshpass -p 'alpine' ssh -o StrictHostKeyChecking=no -p 2222 'root@localhost' 'rm -rf /Library/MobileSubstrate/DynamicLibraries/untetheredbp1.dylib'")
            print(output7)
            sleep(1)
            let output8 = runTerminalCommand("\(resourcesPath)/tools/sshpass -p 'alpine' ssh -o StrictHostKeyChecking=no -p 2222 'root@localhost' 'rm -rf /Library/MobileSubstrate/DynamicLibraries/untetheredbp1.plist'")
            print(output8)
            print("Done!")
            print("Deleting second dylib and plist...")
            sleep(1)
            let output9 = runTerminalCommand("\(resourcesPath)/tools/sshpass -p 'alpine' ssh -o StrictHostKeyChecking=no -p 2222 'root@localhost' 'rm -rf /Library/MobileSubstrate/DynamicLibraries/untetheredbp2.dylib'")
            print(output9)
            sleep(1)
            let output10 = runTerminalCommand("\(resourcesPath)/tools/sshpass -p 'alpine' ssh -o StrictHostKeyChecking=no -p 2222 'root@localhost' 'rm -rf /Library/MobileSubstrate/DynamicLibraries/untetheredbp2.plist'")
            print(output10)
            print("Done!")
            
            sleep(3)

            print("Respringing device...")
            let output11 = runTerminalCommand("\(resourcesPath)/tools/sshpass -p 'alpine' ssh -o StrictHostKeyChecking=no -p 2222 'root@localhost' 'killall backboardd'")
            print(output11)

            sleep(32)

            print("Deactivating device...")
            let output12 = runTerminalCommand("\(resourcesPath)/tools/ideviceactivation deactivate")
            print(output12)

            sleep(5)

            print("Respringing device...")
            let output13 = runTerminalCommand("\(resourcesPath)/tools/sshpass -p 'alpine' ssh -o StrictHostKeyChecking=no -p 2222 'root@localhost' 'killall backboardd'")
            print(output13)

            sleep(32)

            print("Done! Device should now be re-locked!")

            //if let resourcesPath = defineResourcesDirectory() {
                //let output1 = runTerminalCommand("\(resourcesPath)/tools/idevicepair unpair")
                //print(output1)
            sleep(2)
                //let output2 = runTerminalCommand("\(resourcesPath)/tools/idevicepair pair")
                //print(output2)
            sleep(1)
                //let output3 = runTerminalCommand("cd \(resourcesPath) && bash ./deactivate.sh")
                //print(output3)
            sleep(UInt32(1.5))
            print("Deactivation was attempted!")
            print("This should normally be successful, but in some cases you may have to try again.")
            let alert3 = NSAlert()
            alert3.messageText = "Re-lock Done!"
            alert3.informativeText = "The device should now show the Activation Lock screen again."
            alert3.addButton(withTitle: "OK")
            // alert2.addButton(withTitle: "Cancel")
            alert3.runModal()
                // return output1 // Assuming you want to return the output of the terminal command.
            //} else {
                // Handle the case where the resources directory could not be found (unlikely in this scenario)
               // print("Resources directory not found.")
                //return
            //}
            
            
        } else if response == .alertSecondButtonReturn {
            
        }
    }
    
    @IBOutlet weak var welcomeText1: NSTextField!
    
    @IBOutlet weak var infoText1: NSTextField!
    
    @IBOutlet weak var devText1: NSTextField!
    
    @IBOutlet weak var actServerCredit1: NSTextField!
    
    @IBOutlet weak var toolSetupButton: NSButton!
    
    @IBOutlet weak var jailbreakButton: NSButton!
    
    @IBOutlet weak var bypassDeviceButton: NSButton!
    
    @IBOutlet weak var deactivateButton: NSButton!
    
    @IBOutlet weak var youtubeSubscribe1: NSButton!
    
    @IBOutlet weak var instagramFollow1: NSButton!
    
    @IBOutlet weak var twitterFollow1: NSButton!
    
    @IBOutlet weak var step1bp: NSTextField!
    
    @IBOutlet weak var step2bp: NSTextField!
    
    @IBOutlet weak var step3bp: NSTextField!
    
    @IBOutlet weak var step4bp: NSTextField!
    
    @IBOutlet weak var step5bp: NSTextField!
    
    @IBOutlet weak var infobp1: NSTextField!
    
    @IBOutlet weak var substrateButton: NSButton!
    
    @IBOutlet weak var bp1completed: NSTextField!
    
    @IBOutlet weak var firststepdonemaintext: NSTextField!
    
    @IBOutlet weak var substrateInstalledButton: NSButton!
    
    @IBOutlet weak var secondstepdonemaintext: NSTextField!
    
    @IBOutlet weak var bp2completed: NSTextField!
    
    @IBOutlet weak var step1bp2: NSTextField!
    
    @IBOutlet weak var step2bp2: NSTextField!
    
    @IBOutlet weak var step3bp2: NSTextField!
    
    @IBOutlet weak var step4bp2: NSTextField!
    
    @IBOutlet weak var step5bp2: NSTextField!
    
    @IBOutlet weak var step6bp2: NSTextField!
    
    @IBOutlet weak var step7bp2: NSTextField!
    
    @IBOutlet weak var lockedsimdonebutton: NSButton!
    
    
    // func showUntetheredStepsScreen() {
        // self.welcomeText1.isHidden = true
        // self.infoText1.isHidden = true
        // self.youtubeSubscribe1.isHidden = true
        // self.instagramFollow1.isHidden = true
        // self.twitterFollow1.isHidden = true
        // self.toolSetupButton.isHidden = true
        // self.jailbreakButton.isHidden = true
        // self.bypassDeviceButton.isHidden = true
        // self.deactivateButton.isHidden = true
        // self.bp1completed.isHidden = true
        // self.substrateButton.isHidden = true
        
        
    // }
    
    func showUntetheredStepsScreen() {
        NSAnimationContext.runAnimationGroup({ context in
            context.duration = 0.3 // Duration of the animation in seconds
            self.welcomeText1.animator().alphaValue = 0
            self.infoText1.animator().alphaValue = 0
            self.youtubeSubscribe1.animator().alphaValue = 0
            self.instagramFollow1.animator().alphaValue = 0
            self.twitterFollow1.animator().alphaValue = 0
            self.toolSetupButton.animator().alphaValue = 0
            self.jailbreakButton.animator().alphaValue = 0
            self.bypassDeviceButton.animator().alphaValue = 0
            self.deactivateButton.animator().alphaValue = 0
            // Add other elements you want to hide...
        }, completionHandler: {
            self.welcomeText1.isHidden = true
            self.infoText1.isHidden = true
            self.youtubeSubscribe1.isHidden = true
            self.instagramFollow1.isHidden = true
            self.twitterFollow1.isHidden = true
            self.toolSetupButton.isHidden = true
            self.jailbreakButton.isHidden = true
            self.bypassDeviceButton.isHidden = true
            self.deactivateButton.isHidden = true
            // Set isHidden to true for other elements...

            // Now, show the new elements with a sliding effect
            self.step1bp.isHidden = false
            self.step2bp.isHidden = false
            self.step3bp.isHidden = false
            self.step4bp.isHidden = false
            self.step5bp.isHidden = false
            self.substrateInstalledButton.isHidden = false
            self.firststepdonemaintext.isHidden = false
            self.bp1completed.isHidden = false
            self.infobp1.isHidden = false
            // Unhide other elements...

            self.step1bp.frame.origin.x += 100 // Start position off the original position
            self.step2bp.frame.origin.x += 100 // Adjust the value based on your needs
            self.step3bp.frame.origin.x += 100
            self.step4bp.frame.origin.x += 100
            self.step5bp.frame.origin.x += 100
            self.substrateInstalledButton.frame.origin.x += 100
            self.firststepdonemaintext.frame.origin.x += 100
            self.bp1completed.frame.origin.x += 100
            self.infobp1.frame.origin.x += 100
            // self.step2bp.frame.origin.x += 20

            NSAnimationContext.runAnimationGroup({ context in
                context.duration = 0.3
                self.step1bp.animator().frame.origin.x -= 100 // Move to the original position
                self.step2bp.animator().frame.origin.x -= 100
                self.step3bp.animator().frame.origin.x -= 100
                self.step4bp.animator().frame.origin.x -= 100
                self.step5bp.animator().frame.origin.x -= 100
                self.substrateInstalledButton.animator().frame.origin.x -= 100
                self.firststepdonemaintext.animator().frame.origin.x -= 100
                self.bp1completed.animator().frame.origin.x -= 100
                self.infobp1.animator().frame.origin.x -= 100
                // Animate other elements...
            }, completionHandler: {
                // Completion handler if needed
            })
        })
    }
    
    
    @IBAction func substrateInstalledDonePressed(_ sender: Any) {
        sleep(5)
        guard let resourcesPath = Bundle.main.resourcePath else {
            print("Failed to find the main bundle's resource path")
            return
        }
        
        //runTerminalCommand("cd \(resourcePath) && bash ./untether.sh")
        
        let output1 = runTerminalCommand("\(resourcesPath)/tools/idevicepair unpair")
        print(output1)
        let output2 = runTerminalCommand("\(resourcesPath)/tools/idevicepair pair")
        print(output2)
        
        sleep(1)
        
        let alert2 = NSAlert()
        alert2.messageText = "Please press Trust on your device if prompted!"
        alert2.informativeText = "If your connected device is asking to trust the computer, do press Trust now.\nIf not you can ignore this message and click Device is Trusted."
        alert2.addButton(withTitle: "Device is Trusted")
        // alert2.addButton(withTitle: "Cancel")
        alert2.runModal()
        
        // Remove known_hosts file so we don't run into ssh key issue
        let output3 = runTerminalCommand("rm -rf ~/.ssh/known_hosts")
        print(output3)
        
        // Kill iproxy in case its already runnning
        let output4 = runTerminalCommand("cd \(resourcesPath) && killall iproxy")
        print(output4)

        print("Starting iproxy...")

        // Run iproxy in the background
        //runTerminalCommand("cd \(resourcesPath) && ./tools/iproxy 2222:44 > /dev/null 2>&1 &
        let output5 = runTerminalCommand("\(resourcesPath)/tools/iproxy 2222:44 > /dev/null 2>&1 &")
        print(output5)

        sleep(2)
        
        // Mount the filesystem to make modifications
        print("Mounting Filesystems as Read-write...")
        let output6 = runTerminalCommand("cd \(resourcesPath) && ./tools/sshpass -p 'alpine' ssh -o StrictHostKeyChecking=no -p 2222 'root@localhost' 'mount -o rw,union,update /'")
        print(output6)
        print("Mounted!")

        sleep(2)
        
        print("Adding bypass files part 1...")
        sleep(1)
        let output7 = runTerminalCommand("cd \(resourcesPath) && ./tools/sshpass -p 'alpine' ssh -o StrictHostKeyChecking=no -p2222 root@localhost 'dd of=/Library/MobileSubstrate/DynamicLibraries/untetheredbp1.dylib' < patches/untetheredbp1.dylib")
        print(output7)
        let output8 = runTerminalCommand("cd \(resourcesPath) && ./tools/sshpass -p 'alpine' ssh -o StrictHostKeyChecking=no -p2222 root@localhost 'dd of=/Library/MobileSubstrate/DynamicLibraries/untetheredbp1.plist' < patches/untetheredbp1.plist")
        print(output8)
        
        print("Killing CommCenter and CommCenterMobileHelper")
        let output9 = runTerminalCommand("cd \(resourcesPath) && ./tools/sshpass -p alpine ssh -o StrictHostKeyChecking=no root@localhost -p 2222 killall CommCenter && ./tools/sshpass -p alpine ssh -o StrictHostKeyChecking=no root@localhost -p 2222 killall CommCenterMobileHelper")
        print(output9)
        
        sleep(5)
        
        print("Re-adding files for bypass...")
        sleep(1)
        let output10 = runTerminalCommand("cd \(resourcesPath) && ./tools/sshpass -p 'alpine' ssh -o StrictHostKeyChecking=no -p2222 root@localhost 'dd of=/Library/MobileSubstrate/DynamicLibraries/untetheredbp1.dylib' < patches/untetheredbp1.dylib")
        print(output10)
        let output11 = runTerminalCommand("cd \(resourcesPath) && ./tools/sshpass -p 'alpine' ssh -o StrictHostKeyChecking=no -p2222 root@localhost 'dd of=/Library/MobileSubstrate/DynamicLibraries/untetheredbp1.plist' < patches/untetheredbp1.plist")
        print(output11)
        let output12 = runTerminalCommand("cd \(resourcesPath) && ./tools/sshpass -p 'alpine' ssh -o StrictHostKeyChecking=no -p2222 root@localhost 'dd of=/Library/MobileSubstrate/DynamicLibraries/untetheredbp2.dylib' < patches/untetheredbp2.dylib")
        print(output12)
        let output13 = runTerminalCommand("cd \(resourcesPath) && ./tools/sshpass -p 'alpine' ssh -o StrictHostKeyChecking=no -p2222 root@localhost 'dd of=/Library/MobileSubstrate/DynamicLibraries/untetheredbp2.plist' < patches/untetheredbp2.plist")
        print(output13)
        
        sleep(4)
        
        print("Respringing device...")
        sleep(1)
        let output14 = runTerminalCommand("cd \(resourcesPath) && ./tools/sshpass -p alpine ssh -o StrictHostKeyChecking=no root@localhost -p 2222 ldrestart")
        print(output14)
        
        sleep(32)
        
        print("Attempting to fake activation. This is needed to temporarily deactivate the device.")
        sleep(1)
        let output15 = runTerminalCommandv2("cd \(resourcesPath) && ./tools/ideviceactivation activate -s https://appletech752.com/server/epicstuff.php -d")
        print(output15)
        
        print("Removing untetheredbp2.dylib and untetheredbp2.plist...")
        sleep(1)
        let output16 = runTerminalCommand("cd \(resourcesPath) && ./tools/sshpass -p alpine ssh -o StrictHostKeyChecking=no root@localhost -p 2222 rm /Library/MobileSubstrate/DynamicLibraries/untetheredbp2.dylib")
        print(output16)
        let output17 = runTerminalCommand("cd \(resourcesPath) && ./tools/sshpass -p alpine ssh -o StrictHostKeyChecking=no root@localhost -p 2222 rm /Library/MobileSubstrate/DynamicLibraries/untetheredbp2.plist")
        print(output17)
        let output18 = runTerminalCommand("cd \(resourcesPath) && ./tools/sshpass -p alpine ssh -o StrictHostKeyChecking=no root@localhost -p 2222 ldrestart")
        print(output18)

        sleep(32)

        print("Activating Untethered!")
        sleep(1)
        let output19 = runTerminalCommandv2("cd \(resourcesPath) && ./tools/ideviceactivation activate -s https://appletech752.com/server/epicstuff.php -d")
        print(output19)

        // Kill iproxy
        let output20 = runTerminalCommand("killall iproxy")
        print(output20)

        print("Activated! Insert a PIN-locked SIM")
        
        self.showSIMPINStepsScreen()
        
        //if let resourcesPath = defineResourcesDirectory() {
            // let output1 = runTerminalCommand("cd \(resourcesPath) && bash ./untether.sh")
            // print(output1)
        //}
        //print("Activation was attempted!")
        //print("This should normally be successful, but in some cases you may have to try again.")
        
        //let alert1 = NSAlert()
        //alert1.messageText = "Bypass Done!!"
        //alert1.informativeText = "Try setting up your device!\n\nIf it's still locked, click the 'Bypass Device' button again to try again."
        //alert1.addButton(withTitle: "OK")
        // alert2.addButton(withTitle: "Cancel")
        //alert1.runModal()
        
        //self.step1bp.isHidden = true
        //self.step2bp.isHidden = true
        //self.step3bp.isHidden = true
        //self.step4bp.isHidden = true
        //self.step5bp.isHidden = true
        //self.infobp1.isHidden = true
        //self.bp1completed.isHidden = true
        //self.firststepdonemaintext.isHidden = true
        //self.substrateInstalledButton.isHidden = true
            
        //self.welcomeText1.alphaValue = 1
        //self.infoText1.alphaValue = 1
        //self.youtubeSubscribe1.alphaValue = 1
        //self.instagramFollow1.alphaValue = 1
        //self.twitterFollow1.alphaValue = 1
        //self.toolSetupButton.alphaValue = 1
        //self.jailbreakButton.alphaValue = 1
        //self.bypassDeviceButton.alphaValue = 1
        //self.deactivateButton.alphaValue = 1
        
        //self.welcomeText1.isHidden = false
        //self.infoText1.isHidden = false
        //self.youtubeSubscribe1.isHidden = false
        //self.instagramFollow1.isHidden = false
        //self.twitterFollow1.isHidden = false
        //self.toolSetupButton.isHidden = false
        //self.jailbreakButton.isHidden = false
        //self.bypassDeviceButton.isHidden = false
        //self.deactivateButton.isHidden = false
        
    }
    
    func showSIMPINStepsScreen() {
        NSAnimationContext.runAnimationGroup({ context in
            context.duration = 0.3 // Duration of the animation in seconds
            self.step1bp.animator().alphaValue = 0
            self.step2bp.animator().alphaValue = 0
            self.step3bp.animator().alphaValue = 0
            self.step4bp.animator().alphaValue = 0
            self.step5bp.animator().alphaValue = 0
            self.substrateInstalledButton.animator().alphaValue = 0
            self.firststepdonemaintext.animator().alphaValue = 0
            self.bp1completed.animator().alphaValue = 0
            self.infobp1.animator().alphaValue = 0
            // Add other elements you want to hide...
        }, completionHandler: {
            self.step1bp.isHidden = true
            self.step2bp.isHidden = true
            self.step3bp.isHidden = true
            self.step4bp.isHidden = true
            self.step5bp.isHidden = true
            self.substrateInstalledButton.isHidden = true
            self.firststepdonemaintext.isHidden = true
            self.bp1completed.isHidden = true
            self.infobp1.isHidden = true
            // Set isHidden to true for other elements...

            // Now, show the new elements with a sliding effect
            self.step1bp2.isHidden = false
            self.step2bp2.isHidden = false
            self.step3bp2.isHidden = false
            self.step4bp2.isHidden = false
            self.step5bp2.isHidden = false
            self.step6bp2.isHidden = false
            self.step7bp2.isHidden = false
            self.lockedsimdonebutton.isHidden = false
            self.secondstepdonemaintext.isHidden = false
            self.bp2completed.isHidden = false
            //self.infobp1.isHidden = false
            // Unhide other elements...

            self.step1bp2.frame.origin.x += 100 // Start position off the original position
            self.step2bp2.frame.origin.x += 100 // Adjust the value based on your needs
            self.step3bp2.frame.origin.x += 100
            self.step4bp2.frame.origin.x += 100
            self.step5bp2.frame.origin.x += 100
            self.step6bp2.frame.origin.x += 100
            self.step7bp2.frame.origin.x += 100
            self.lockedsimdonebutton.frame.origin.x += 100
            self.secondstepdonemaintext.frame.origin.x += 100
            self.bp2completed.frame.origin.x += 100
            //self.infobp1.frame.origin.x += 100
            // self.step2bp.frame.origin.x += 20

            NSAnimationContext.runAnimationGroup({ context in
                context.duration = 0.3
                self.step1bp2.animator().frame.origin.x -= 100 // Move to the original position
                self.step2bp2.animator().frame.origin.x -= 100
                self.step3bp2.animator().frame.origin.x -= 100
                self.step4bp2.animator().frame.origin.x -= 100
                self.step5bp2.animator().frame.origin.x -= 100
                self.step6bp2.animator().frame.origin.x -= 100
                self.step7bp2.animator().frame.origin.x -= 100
                self.lockedsimdonebutton.animator().frame.origin.x -= 100
                self.secondstepdonemaintext.animator().frame.origin.x -= 100
                self.bp2completed.animator().frame.origin.x -= 100
                //self.infobp1.animator().frame.origin.x -= 100
                // Animate other elements...
            }, completionHandler: {
                // Completion handler if needed
            })
        })
    }
    
    @IBAction func lockedSIMDoneButtonPressed(_ sender: Any) {
        sleep(2)
        guard let resourcesPath = Bundle.main.resourcePath else {
            print("Failed to find the main bundle's resource path")
            return
        }
        
        //runTerminalCommand("cd \(resourcePath) && bash ./untether.sh")
        
        print("User marked iCloud bypass fully complete.")
        print("This should normally be successful, but in some cases you may have to try again.")
        
        let alert1 = NSAlert()
        alert1.messageText = "Bypass Done!!"
        alert1.informativeText = "Enjoy your iCloud bypassed device!\n\nPS. If you enjoyed using this tool and got some of your devices unlocked, send me a DM on X (@AlwaysAppleFTD) or Instagram (@finn.desilva) :)"
        alert1.addButton(withTitle: "OK")
        // alert2.addButton(withTitle: "Cancel")
        alert1.runModal()
        
        self.step1bp2.isHidden = true
        self.step2bp2.isHidden = true
        self.step3bp2.isHidden = true
        self.step4bp2.isHidden = true
        self.step5bp2.isHidden = true
        self.step6bp2.isHidden = true
        self.step7bp2.isHidden = true
        //self.infobp1.isHidden = true
        self.bp2completed.isHidden = true
        self.secondstepdonemaintext.isHidden = true
        self.lockedsimdonebutton.isHidden = true
        
        self.step1bp.alphaValue = 1
        self.step2bp.alphaValue = 1
        self.step3bp.alphaValue = 1
        self.step4bp.alphaValue = 1
        self.step5bp.alphaValue = 1
        self.substrateInstalledButton.alphaValue = 1
        self.firststepdonemaintext.alphaValue = 1
        self.bp1completed.alphaValue = 1
        self.infobp1.alphaValue = 1
            
        self.welcomeText1.alphaValue = 1
        self.infoText1.alphaValue = 1
        self.youtubeSubscribe1.alphaValue = 1
        self.instagramFollow1.alphaValue = 1
        self.twitterFollow1.alphaValue = 1
        self.toolSetupButton.alphaValue = 1
        self.jailbreakButton.alphaValue = 1
        self.bypassDeviceButton.alphaValue = 1
        self.deactivateButton.alphaValue = 1
        
        self.welcomeText1.isHidden = false
        self.infoText1.isHidden = false
        self.youtubeSubscribe1.isHidden = false
        self.instagramFollow1.isHidden = false
        self.twitterFollow1.isHidden = false
        self.toolSetupButton.isHidden = false
        self.jailbreakButton.isHidden = false
        self.bypassDeviceButton.isHidden = false
        self.deactivateButton.isHidden = false
    }
    
    
    func promptForPassword() -> String? {
        let alert = NSAlert()
        alert.messageText = "Please enter your computer login password here."
        alert.informativeText = "We need this in order to use the sudo command. Normally, you would type this in the terminal window, but because this is an application, this is where the password should be typed. It is ONLY stored locally on this computer for a few seconds."
        
        let textField = NSTextField(frame: NSRect(x: 0, y: 0, width: 300, height: 24))
        textField.placeholderString = "Computer Login Password"
        
        // Add the text field to the alert
        alert.accessoryView = textField
        
        // Add only the OK button
        alert.addButton(withTitle: "OK")
        
        // Show the alert
        let response = alert.runModal()
        
        // If the user clicked "OK", check the input value
        if response == .alertFirstButtonReturn {
            let input = textField.stringValue.trimmingCharacters(in: .whitespacesAndNewlines)
            return input.isEmpty ? nil : input
        } else {
            // This branch is unlikely to be executed since there's no Cancel button
            return nil
        }
    }
    
    private func executeSudoCommandWithPassword(command: String, password: String) {
        let process = Process()
        let pipe = Pipe()

        process.launchPath = "/usr/bin/env"
        process.arguments = ["sudo", "-S", command]  // '-S' option to read the password from the standard input
        process.standardInput = pipe
        process.standardOutput = Pipe()  // You can redirect output as needed

        do {
            try process.run()
            // Write the password followed by a newline into the pipe, then close the pipe
            if let passwordData = "\(password)\n".data(using: .utf8) {
                pipe.fileHandleForWriting.write(passwordData)
                pipe.fileHandleForWriting.closeFile()
            }

            process.waitUntilExit()
            // Handle the completion of the command
        } catch {
            // Handle errors
            print("Failed to execute command: \(error)")
        }
    }

    private func promptAndExecuteCommand() {
        if let password = promptForPassword(), !password.isEmpty {
            executeSudoCommandWithPassword(command: "your_command_here", password: password)
        }
    }
    
    
    func testAlert() {
        let alert2 = NSAlert()
        alert2.messageText = "First Step Done!"
        alert2.informativeText = "Your device was activated tethered.\nTo complete the bypass and make it fully untethered, you will need to complete a few simple steps. Please follow these steps, and click the button below once done.\n\n1. Set up your device.\n2. Open the checkra1n loader (most times on the second screen) and install Cydia.\n3. Once Cydia is installed, open it up and IGNORE all upgrades. This will save time and is not necessary for the bypass to work.\n4. Click the Search icon tab on the far right bottom, tap the Search bar, and search for the package 'Cydia Substrate'. The quotes are only to show the exact name and not confuse you, they are not needed when searching the actual package. \n5. Tap Modify, then Install, and finally, Confirm. The package will install, then click the 'Restart SpringBoard' button when done. If it says any error like 'DPKG_LOCKED' or something like that, DO NOT waste time restarting the SpringBoard! Instead, quit the app (not just close by going home), by opening the App Switcher with all open apps and swiping up to quit Cydia. Open Cydia again, and follow steps 3 - 5. Once you see all the white text, and none of it has errors, restart the SpringBoard.\n\nIMPORTANT: Please only click OK when the device is back on the Lock Screen! If you continue before that, the tool may fail to connect to your device."
        alert2.addButton(withTitle: "Cydia Substrate is Installed with No Errors")
        // alert2.addButton(withTitle: "Cancel")
        alert2.runModal()
    }
    
    
    @IBAction func youtubeSubscribe(_ sender: NSButton) {
        if let url = URL(string: "https://youtube.com/@alwaysappleftd/videos?sub_confirmation=1") {
                NSWorkspace.shared.open(url)
            }
    }
    
    @IBAction func instagramFollow(_ sender: NSButton) {
        if let url = URL(string: "https://instagram.com/finn.desilva") {
                NSWorkspace.shared.open(url)
            }
    }
    
    @IBAction func twitterFollow(_ sender: NSButton) {
        if let url = URL(string: "https://twitter.com/intent/follow?screen_name=AlwaysAppleFTD") {
            NSWorkspace.shared.open(url)
        }
    }
    
    @IBAction func openHelpSite(_ sender: Any) {
        if let url = URL(string: "https://alwaysappleftd.github.io/software/Passra1n.html") {
                NSWorkspace.shared.open(url)
            }
    }
    
    @IBAction func openReportBug(_ sender: Any) {
        if let url = URL(string: "mailto:alwaysappleftd@icloud.com?subject=Issue%20with%20Passra1n") {
                NSWorkspace.shared.open(url)
            }
    }
    
    func runTerminalCommandv2(_ command: String) {
        let task = Process()
        let outputPipe = Pipe()
        let errorPipe = Pipe()

        task.standardOutput = outputPipe
        task.standardError = errorPipe
        task.arguments = ["-c", command]
        task.launchPath = "/bin/bash"

        outputPipe.fileHandleForReading.waitForDataInBackgroundAndNotify()
        errorPipe.fileHandleForReading.waitForDataInBackgroundAndNotify()

        var outputObserver: NSObjectProtocol!
        var errorObserver: NSObjectProtocol!

        outputObserver = NotificationCenter.default.addObserver(forName: NSNotification.Name.NSFileHandleDataAvailable, object: outputPipe.fileHandleForReading , queue: nil) { notification in
            let output = outputPipe.fileHandleForReading.availableData
            if let line = String(data: output, encoding: String.Encoding.utf8) {
                print(line, terminator: "") // Print without adding a new line
            }
            outputPipe.fileHandleForReading.waitForDataInBackgroundAndNotify()
        }

        errorObserver = NotificationCenter.default.addObserver(forName: NSNotification.Name.NSFileHandleDataAvailable, object: errorPipe.fileHandleForReading , queue: nil) { notification in
            let output = errorPipe.fileHandleForReading.availableData
            if let line = String(data: output, encoding: String.Encoding.utf8) {
                print(line, terminator: "") // Print without adding a new line
            }
            errorPipe.fileHandleForReading.waitForDataInBackgroundAndNotify()
        }

        task.launch()
        task.waitUntilExit()

        NotificationCenter.default.removeObserver(outputObserver)
        NotificationCenter.default.removeObserver(errorObserver)
    }
    
    @discardableResult
    func runTerminalCommand(_ command: String) -> String {
        print(command)  // Debugging

        let task = Process()
        let outPipe = Pipe()
        let errPipe = Pipe()

        task.standardOutput = outPipe
        task.standardError = errPipe
        task.arguments = ["-c", command]
        task.launchPath = "/bin/zsh"

        task.launch()
        task.waitUntilExit()

        if task.terminationStatus != 0 {
            print("Command failed with status: \(task.terminationStatus)")
        }

        let outData = outPipe.fileHandleForReading.readDataToEndOfFile()
        let errData = errPipe.fileHandleForReading.readDataToEndOfFile()

        let output = String(data: outData, encoding: .utf8) ?? ""
        let errorOutput = String(data: errData, encoding: .utf8) ?? ""

        if !output.isEmpty {
            return output
        } else if !errorOutput.isEmpty {
            return errorOutput
        } else {
            return "Command executed, but no output captured."
        }
    }
    
    func runShellCommand(commandName: String, arguments: [String] = []) {
        guard let resourcePath = Bundle.main.resourcePath else {
            print("Failed to find the main bundle's resource path")
            return
        }
        
        let commandPath = "\(resourcePath)/\(commandName)"
        
        let process = Process()
        process.executableURL = URL(fileURLWithPath: "/bin/sh")
        process.arguments = [commandPath] + arguments
        
        do {
            try process.run()
            process.waitUntilExit()
        } catch {
            // If failed, then print the error
            print("Failed to run command: \(error)")
        }
    }
    
    func runiDeviceInfoCommandUntilNoError(completion: @escaping (String) -> Void) {
        var output = ""
        var attempts = 0
        let maxAttempts = 5000

        func attemptCommand() {
            if attempts >= maxAttempts {
                print("Maximum attempts reached.")
                DispatchQueue.main.async { completion(output) }
                return
            }

            let task = Process()
            let outputPipe = Pipe()
            let errorPipe = Pipe()

            task.standardOutput = outputPipe
            task.standardError = errorPipe

            if let resourcesPath = self.defineResourcesDirectory() {
                task.arguments = ["-c", "\(resourcesPath)/tools/ideviceinfo"]
                task.launchPath = "/bin/bash"
            } else {
                print("Resources path is nil.")
                DispatchQueue.main.async { completion("") }
                return
            }

            attempts += 1

            task.launch()

            task.waitUntilExit()

            let outputData = outputPipe.fileHandleForReading.readDataToEndOfFile()
            let errorData = errorPipe.fileHandleForReading.readDataToEndOfFile()

            output = String(data: outputData, encoding: .utf8) ?? ""
            let errorOutput = String(data: errorData, encoding: .utf8) ?? ""

            if !errorOutput.isEmpty {
                print("Attempt \(attempts): \(errorOutput)")
                DispatchQueue.global(qos: .background).asyncAfter(deadline: .now() + 1) {
                    attemptCommand()
                }
            } else {
                DispatchQueue.main.async { completion(output) }
            }
        }

        DispatchQueue.global(qos: .background).async {
            attemptCommand()
        }
    }

    func runCheckra1nForFiveSeconds(completion: @escaping () -> Void) {
        let task = Process()
        let outputPipe = Pipe()
        let errorPipe = Pipe()

        if let resourcesPath = defineResourcesDirectory() {
            task.arguments = ["-c", "\(resourcesPath)/jailbreak/checkra1n -c -V -E"]
        } else {
            print("Resources path is nil.")
            completion()
            return
        }
        task.launchPath = "/bin/bash"
        task.standardOutput = outputPipe
        task.standardError = errorPipe
        
        DispatchQueue.global(qos: .background).async {
            do {
                try task.run()
                DispatchQueue.global().asyncAfter(deadline: .now() + 10) {
                    task.terminate()
                    completion()
                    return
                }
                task.waitUntilExit()
            } catch {
                DispatchQueue.main.async {
                    print("Failed to start the task: \(error)")
                }
                completion()
                return
            }
            
            // Reading the output and error asynchronously
            let outputData = outputPipe.fileHandleForReading.readDataToEndOfFile()
            let output = String(data: outputData, encoding: .utf8) ?? ""
            
            let errorData = errorPipe.fileHandleForReading.readDataToEndOfFile()
            let errorOutput = String(data: errorData, encoding: .utf8) ?? ""
            
            DispatchQueue.main.async {
                print("Output: \(output)")
                print("Error: \(errorOutput)")
                completion()
            }
        }
    }
    
    func defineResourcesDirectory() -> String? {
        let appDirectory = Bundle.main.bundlePath
        let resourcesDirectory = "\(appDirectory)/Contents/Resources"
        return resourcesDirectory
    }
    
    private func printAppDirectory() {
            let appDirectory = Bundle.main.bundlePath
            print("App is stored in: \(appDirectory)/Contents")
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.printAppDirectory()
        bypassDeviceButton.isEnabled = false
        deactivateButton.isEnabled = false
        self.step1bp.isHidden = true
        self.step2bp.isHidden = true
        self.step3bp.isHidden = true
        self.step4bp.isHidden = true
        self.step5bp.isHidden = true
        self.infobp1.isHidden = true
        self.bp1completed.isHidden = true
        self.firststepdonemaintext.isHidden = true
        self.substrateInstalledButton.isHidden = true
        
        self.step1bp2.isHidden = true
        self.step2bp2.isHidden = true
        self.step3bp2.isHidden = true
        self.step4bp2.isHidden = true
        self.step5bp2.isHidden = true
        self.step6bp2.isHidden = true
        self.step7bp2.isHidden = true
        self.bp2completed.isHidden = true
        self.secondstepdonemaintext.isHidden = true
        self.lockedsimdonebutton.isHidden = true
        

        // Do any additional setup after loading the view.
    }

    override func viewDidAppear() {
        super.viewDidAppear()
        // testAlert()
        // showUntetheredStepsScreen()
        
    }
    
    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

