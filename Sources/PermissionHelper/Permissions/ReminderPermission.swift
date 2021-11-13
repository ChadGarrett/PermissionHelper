//
//  File.swift
//  
//
//  Created by Chad Garrett on 2021/11/13.
//

import EventKit

extension PermissionHelper {
    public static var reminders = RemindersPermission()
}

public final class RemindersPermission: PermissionHelperInterface {
    func getStatus() -> PermissionHelper.PermissionType {
        switch EKEventStore.authorizationStatus(for: .reminder) {
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
        EKEventStore().requestAccess(to: .reminder) { _, _ in
            completion()
        }
    }
}

