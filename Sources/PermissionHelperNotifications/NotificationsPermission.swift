//
//  File.swift
//  
//
//  Created by Chad Garrett on 2021/11/13.
//

#if PERMISSION_HELPER
import PermissionHelper
#endif

#if PERMISSION_HELPER_NOTIFICATIONS

import UserNotifications

extension PermissionHelper {
    public static var notifications = NotificationsPermission()
}

public final class NotificationsPermission: PermissionHelperInterface {
    public func getStatus() -> PermissionHelper.PermissionType {
        guard let authorizationStatus = fetchAuthorizationStatus()
        else { return .undetermined }
        
        switch authorizationStatus {
        case .notDetermined:
            return .undetermined
        case .denied:
            return .denied
        case .authorized:
            return .granted
        case .provisional:
            return .granted
        case .ephemeral:
            return .granted
        @unknown default:
            return .denied
        }
    }
    
    public func requestPermission(completion: @escaping () -> Void) {
        UNUserNotificationCenter.current().requestAuthorization(options: [.badge, .alert, .sound]) { _, _ in
            DispatchQueue.main.async {
                completion()
            }
        }
    }
    
    private func fetchAuthorizationStatus() -> UNAuthorizationStatus? {
        var settings: UNNotificationSettings?
        
        // Semaphore to wait on current thread
        let semaphore = DispatchSemaphore(value: 0)
        
        DispatchQueue.global().async {
            UNUserNotificationCenter.current().getNotificationSettings { setttings in
                settings = setttings
                // Return to waiting thread
                semaphore.signal()
            }
        }
        
        semaphore.wait()
        return settings?.authorizationStatus
    }
}

#endif
