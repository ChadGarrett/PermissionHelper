//
//  File.swift
//  
//
//  Created by Chad Garrett on 2021/11/13.
//

#if PERMISSION_HELPER
import PermissionHelper
#endif

#if PERMISSION_HELPER_REMINDERS

import EventKit

extension PermissionHelper {
    public static var reminders = RemindersPermission()
}

public final class RemindersPermission: PermissionHelperInterface {
    public func getStatus() -> PermissionHelper.PermissionType {
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
    
    public func requestPermission(completion: @escaping () -> Void) {
        EKEventStore().requestAccess(to: .reminder) { _, _ in
            completion()
        }
    }
}

#endif
