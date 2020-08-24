//
//  PMTableViewCell.swift
//  MMBKitTester
//
//  Created by Rasid Ramazanov on 19.08.2020.
//  Copyright © 2020 Mobven. All rights reserved.
//

import Foundation
import UIKit
import PermissionManager
import NotificationCenter

// swiftlint:disable all
class PMTableViewCell: UITableViewCell {
    @IBOutlet private weak var permissionName: UILabel!
    @IBOutlet private weak var permissionStatus: UILabel!
    @IBOutlet weak var grantBttn: UIButton!
    
    
    var permission: Permission!
    weak var permissionDelagate: PMTableViewCellDelegate!
    
    func set(permission: Permission, delagate: PMTableViewCellDelegate) {
        self.permission = permission
        self.permissionDelagate = delagate
        
        checkStatus(permission: permission)
        
        permissionName.text = permission.humanReadableString
    }
    
    private func checkStatus(permission: Permission) {
        switch permission {
        case .bluetooth:
            self.permissionStatus.text = "Not Yet :("
        case .camera:
            PermissionManager.shared().status { (result: PermissionResult<CameraManager.Result>) in
                switch result {
                case .allowed:
                    self.permissionStatus.text = "Allowed"
                case .notAllowed:
                    self.permissionStatus.text = "Not Allowed"
                case .restricted:
                    self.permissionStatus.text = "Restricted"
                case .unknown:
                    self.permissionStatus.text = "Unknown"
                case .notDetermined:
                    self.permissionStatus.text = "N/A"
                }
            }
        case .photos:
            PermissionManager.shared().status { (result: PermissionResult<PhotosManager.Result>) in
                switch result {
                case .allowed:
                    self.permissionStatus.text = "Allowed"
                case .notAllowed:
                    self.permissionStatus.text = "Not Allowed"
                case .restricted:
                    self.permissionStatus.text = "Restricted"
                case .unknown:
                    self.permissionStatus.text = "Unknown"
                case .notDetermined:
                    self.permissionStatus.text = "N/A"
                }
            }
        case .notification:
            PermissionManager.shared().status { (result: PermissionResult<NotificationManager.Result>) in
                switch result {
                case .allowed:
                    DispatchQueue.main.async {
                        self.permissionStatus.text = "Allowed"
                    }
                case .notAllowed:
                    DispatchQueue.main.async {
                        self.permissionStatus.text = "Not Allowed"
                    }
                case .restricted:
                    self.permissionStatus.text = "Restricted"
                case .unknown:
                    self.permissionStatus.text = "Unknown"
                case .notDetermined:
                    self.permissionStatus.text = "N/A"
                }
            }
        case .calendar:
            PermissionManager.shared().status { (result: PermissionResult<CalendarManager.Result>) in
                switch result {
                case .allowed:
                    self.permissionStatus.text = "Allowed"
                case .notAllowed:
                    self.permissionStatus.text = "Not Allowed"
                case .restricted:
                    self.permissionStatus.text = "Restricted"
                case .unknown:
                    self.permissionStatus.text = "Unknown"
                case .notDetermined:
                    self.permissionStatus.text = "N/A"
                }
            }
        case .contacts:
            PermissionManager.shared().status { (result: PermissionResult<ContactsManager.Result>) in
                switch result {
                case .allowed:
                    self.permissionStatus.text = "Allowed"
                case .notAllowed:
                    self.permissionStatus.text = "Not Allowed"
                case .restricted:
                    self.permissionStatus.text = "Restricted"
                case .unknown:
                    self.permissionStatus.text = "Unknown"
                case .notDetermined:
                    self.permissionStatus.text = "N/A"
                }
            }
        case .microphone:
            PermissionManager.shared().status { (result: PermissionResult<MicrophoneManager.Result>) in
                switch result {
                case .allowed:
                    self.permissionStatus.text = "Allowed"
                case .notAllowed:
                    self.permissionStatus.text = "Not Allowed"
                case .restricted:
                    self.permissionStatus.text = "Restricted"
                case .unknown:
                    self.permissionStatus.text = "Unknown"
                case .notDetermined:
                    self.permissionStatus.text = "N/A"
                }
            }
            
        case .location(let locationType):
            switch locationType {
            case .requestAlways:
                PermissionManager.shared().status { (result: PermissionResult<LocationAlwaysManager.Result>) in
                    switch result {
                    case .allowed:
                        self.permissionStatus.text = "Allowed"
                    case .notAllowed:
                        self.permissionStatus.text = "Not Allowed"
                    case .restricted:
                        self.permissionStatus.text = "Restricted"
                    case .unknown:
                        self.permissionStatus.text = "Unknown"
                    case .notDetermined:
                        self.permissionStatus.text = "N/A"
                    }
                }
            case .requestWhenInUse:
                PermissionManager.shared().status { (result: PermissionResult<LocationWhenInUseManager.Result>) in
                    switch result {
                    case .allowed:
                        self.permissionStatus.text = "Allowed"
                    case .notAllowed:
                        self.permissionStatus.text = "Not Allowed"
                    case .restricted:
                        self.permissionStatus.text = "Restricted"
                    case .unknown:
                        self.permissionStatus.text = "Unknown"
                    case .notDetermined:
                        self.permissionStatus.text = "N/A"
                    }
                }
            }
        }
    }
    
    @IBAction private func grant() {
        switch permission! {
        case .bluetooth:
            break
        case .camera:
            PermissionManager.shared().request { (result : PermissionResult<CameraManager.Result>) in
                switch result {
                case .allowed:
                    break
                case .notAllowed:
                    DispatchQueue.main.async {
                        self.permissionDelagate.userDidDenied()
                    }
                case .restricted:
                    break
                case .unknown:
                    break
                case .notDetermined:
                    break
                }
                self.permissionDelagate.permissionUpdated()
            }
        case .photos:
            PermissionManager.shared().request { (result : PermissionResult<PhotosManager.Result>) in
                switch result {
                case .allowed:
                    break
                case .notAllowed:
                    DispatchQueue.main.async {
                        self.permissionDelagate.userDidDenied()
                    }
                case .restricted:
                    break
                case .unknown:
                    break
                case .notDetermined:
                    break
                }
                self.permissionDelagate.permissionUpdated()
            }
        case .notification:
            PermissionManager.shared().request { (result : PermissionResult<NotificationManager.Result>) in
                switch result {
                case .allowed:
                    break
                case .notAllowed:
                    DispatchQueue.main.async {
                        self.permissionDelagate.userDidDenied()
                    }
                case .restricted:
                    break
                case .unknown:
                    break
                case .notDetermined:
                    break
                }
                self.permissionDelagate.permissionUpdated()
            }
        case .location(let locationType):
            switch locationType {
            case .requestAlways:
                PermissionManager.shared().request { (result : PermissionResult<LocationAlwaysManager.Result>) in
                    switch result {
                    case .allowed:
                        break
                    case .notAllowed:
                        DispatchQueue.main.async {
                            self.permissionDelagate.userDidDenied()
                        }
                    case .restricted:
                        break
                    case .unknown:
                        break
                    case .notDetermined:
                        break
                    }
                    self.permissionDelagate.permissionUpdated()
                }
            case .requestWhenInUse:
                PermissionManager.shared().request { (result : PermissionResult<LocationWhenInUseManager.Result>) in
                    switch result {
                    case .allowed:
                        break
                    case .notAllowed:
                        DispatchQueue.main.async {
                            self.permissionDelagate.userDidDenied()
                        }
                    case .restricted:
                        break
                    case .unknown:
                        break
                    case .notDetermined:
                        break
                    }
                    self.permissionDelagate.permissionUpdated()
                }
            }
            
        case .calendar:
            PermissionManager.shared().request { (result : PermissionResult<CalendarManager.Result>) in
                switch result {
                case .allowed:
                    break
                case .notAllowed:
                    break
                case .restricted:
                    break
                case .unknown:
                    break
                case .notDetermined:
                    break
                }
                self.permissionDelagate.permissionUpdated()
            }
        case .contacts:
            PermissionManager.shared().request { (result : PermissionResult<ContactsManager.Result>) in
                switch result {
                case .allowed:
                    break
                case .notAllowed:
                    DispatchQueue.main.async {
                        self.permissionDelagate.userDidDenied()
                    }
                case .restricted:
                    break
                case .unknown:
                    break
                case .notDetermined:
                    break
                }
                self.permissionDelagate.permissionUpdated()
            }
        case .microphone:
            PermissionManager.shared().request { (result : PermissionResult<MicrophoneManager.Result>) in
                switch result {
                case .allowed:
                    break
                case .notAllowed:
                    DispatchQueue.main.async {
                        self.permissionDelagate.userDidDenied()
                    }
                case .restricted:
                    break
                case .unknown:
                    break
                case .notDetermined:
                    break
                }
                self.permissionDelagate.permissionUpdated()
            }
        }
    }
    // swiftlint:enable all
}

extension Permission {
    var humanReadableString: String {
        switch self {
        case .bluetooth:
            return "Bluetooth"
        case .camera:
            return "Camera"
        case .photos:
            return "Photos"
        case .notification:
            return "Notification"
        case .location(let locationType):
            switch locationType {
            case .requestAlways:
                return "Request Always"
            case .requestWhenInUse:
                return "Location When In Use"
            }
            
        case .calendar:
            return "Calendar"
        case .contacts:
            return "Contacts"
        case .microphone:
            return "Microphone"
        }
    }
}

protocol PMTableViewCellDelegate: AnyObject {
    func permissionUpdated()
    func userDidDenied()
}
