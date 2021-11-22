//
//  File.swift
//  
//
//  Created by Chad Garrett on 2021/11/12.
//

#if PERMISSION_HELPER
import PermissionHelper
#endif

#if PERMISSION_HELPER_CAMERA

import AVFoundation

extension PermissionHelper {
    public static var camera = CameraPermission()
}

public final class CameraPermission: PermissionHelperInterface {
    public func getStatus() -> PermissionHelper.PermissionType {
        switch AVCaptureDevice.authorizationStatus(for: .video) {
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
        AVCaptureDevice.requestAccess(for: .video) { _ in
            DispatchQueue.main.async {
                completion()
            }
        }
    }
}

#endif
