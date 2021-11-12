//
//  File.swift
//  
//
//  Created by Chad Garrett on 2021/11/12.
//

import Contacts

extension PermissionHelper {
    public static var contacts = ContactsPermission()
}

public final class ContactsPermission: PermissionHelperInterface {
    func getStatus() -> PermissionHelper.PermissionType {
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
    
    func requestPermission(completion: @escaping () -> Void) {
        CNContactStore().requestAccess(for: .contacts) { _, _ in
            DispatchQueue.main.async {
                completion()
            }
        }
    }
}
