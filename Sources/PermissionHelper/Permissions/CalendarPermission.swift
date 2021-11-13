//
//  File.swift
//  
//
//  Created by Chad Garrett on 2021/11/13.
//

import EventKit

extension PermissionHelper {
    public static var calendar = ContactsPermission()
}

public final class CalendarPermission: PermissionHelperInterface {
    func getStatus() -> PermissionHelper.PermissionType {
        switch EKEventStore.authorizationStatus(for: .event) {
        case .notDetermined:
            return .undetermined
        case .restricted:
            return .denied
        case .denied:
            return .denied
        case .authorized:
            return .granted
        @unknown default:
            return .denied
        }
    }
    
    func requestPermission(completion: @escaping () -> Void) {
        EKEventStore().requestAccess(to: .event) { _, _ in
            completion()
        }
    }
}
