//
//  File.swift
//  
//
//  Created by Chad Garrett on 2021/11/13.
//

#if PERMISSION_HELPER
import PermissionHelper
#endif

#if PERMISSION_HELPER_SIRI

import Intents

extension SiriPermission {
    public static var siri = SiriPermission()
}

public final class SiriPermission: PermissionHelperInterface {
    public func getStatus() -> PermissionHelper.PermissionType {
        switch INPreferences.siriAuthorizationStatus() {
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
        INPreferences.requestSiriAuthorization { _ in
            DispatchQueue.main.async {
                completion()
            }
        }
    }
}

#endif
