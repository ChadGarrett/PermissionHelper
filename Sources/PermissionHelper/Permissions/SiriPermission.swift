//
//  File.swift
//  
//
//  Created by Chad Garrett on 2021/11/13.
//

import Intents

extension SiriPermission {
    public static var siri = SiriPermission()
}

public final class SiriPermission: PermissionHelperInterface {
    func getStatus() -> PermissionHelper.PermissionType {
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
    
    func requestPermission(completion: @escaping () -> Void) {
        INPreferences.requestSiriAuthorization { _ in
            DispatchQueue.main.async {
                completion()
            }
        }
    }
}
