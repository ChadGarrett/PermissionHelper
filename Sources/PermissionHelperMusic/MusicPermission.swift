//
//  File.swift
//  
//
//  Created by Chad Garrett on 2021/11/13.
//

#if PERMISSION_HELPER
import PermissionHelper
#endif

#if PERMISSION_HELPER_MUSIC

import MediaPlayer

extension PermissionHelper {
    public static var music = MusicPermission()
}

public final class MusicPermission: PermissionHelperInterface {
    public func getStatus() -> PermissionHelper.PermissionType {
        switch MPMediaLibrary.authorizationStatus() {
        case .notDetermined:
            return .undetermined
        case .denied:
            return .denied
        case .restricted:
            return .denied
        case .authorized:
            return .granted
        @unknown default:
            return .denied
        }
    }
    
    public func requestPermission(completion: @escaping () -> Void) {
        MPMediaLibrary.requestAuthorization { _ in
            completion()
        }
    }
}

#endif
