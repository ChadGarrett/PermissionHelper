//
//  File.swift
//  
//
//  Created by Chad Garrett on 2021/11/13.
//

#if PERMISSION_HELPER
import PermissionHelper
#endif

#if PERMISSION_HELPER_PHOTOS

import Photos

extension PermissionHelper {
    public static var photos = PhotosPermission()
}

public final class PhotosPermission: PermissionHelperInterface {
    public func getStatus() -> PermissionHelper.PermissionType {
        switch PHPhotoLibrary.authorizationStatus() {
        case .notDetermined:
            return .undetermined
        case .restricted:
            return .denied
        case .denied:
            return .denied
        case .authorized:
            return .granted
        case .limited:
            return .granted
        @unknown default:
            return .denied
        }
    }
    
    /// Requests full permission to the photo library
    public func requestPermission(completion: @escaping () -> Void) {
        PHPhotoLibrary.requestAuthorization { _ in
            DispatchQueue.main.async {
                completion()
            }
        }
    }
    
    /// Requests permission to just add items to photos
    @available(iOS 14, *)
    public func requestWritePermission(completion: @escaping () -> Void) {
        PHPhotoLibrary.requestAuthorization(for: .addOnly) { _ in
            completion()
        }
    }
}

#endif
