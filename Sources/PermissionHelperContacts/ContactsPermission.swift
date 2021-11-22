//
//  File.swift
//  
//
//  Created by Chad Garrett on 2021/11/12.
//

#if PERMISSION_HELPER
import PermissionHelper
#endif

#if PERMISSION_HELPER_CONTACTS

import Contacts

extension PermissionHelper {
    public static var contacts = ContactsPermission()
}

public final class ContactsPermission: PermissionHelperInterface {
    public func getStatus() -> PermissionHelper.PermissionType {
        switch CNContactStore.authorizationStatus(for: .contacts) {
        case .authorized:
            return .granted
        case .notDetermined:
            return .undetermined
        case .restricted:
            return .denied
        case .denied:
            return .denied
        @unknown default:
            return .denied
        }
    }
    
    public func requestPermission(completion: @escaping () -> Void) {
        CNContactStore().requestAccess(for: .contacts) { _, _ in
            DispatchQueue.main.async {
                completion()
            }
        }
    }
}

#endif
