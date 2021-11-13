//
//  File.swift
//  
//
//  Created by Chad Garrett on 2021/11/13.
//

import MediaPlayer

extension PermissionHelper {
    public static var music = MusicPermission()
}

public final class MusicPermission: PermissionHelperInterface {
    func getStatus() -> PermissionHelper.PermissionType {
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
    
    func requestPermission(completion: @escaping () -> Void) {
        MPMediaLibrary.requestAuthorization { _ in
            completion()
        }
    }
}
