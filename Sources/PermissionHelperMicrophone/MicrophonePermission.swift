//
//  File.swift
//  
//
//  Created by Chad Garrett on 2021/11/12.
//

#if PERMISSION_HELPER
import PermissionHelper
#endif

#if PERMISSION_HELPER_MICROPHONE

import AVFoundation

extension PermissionHelper {
    public static var microphone = MicrophonePermission()
}

public final class MicrophonePermission: PermissionHelperInterface {
    public func getStatus() -> PermissionHelper.PermissionType {
        switch AVAudioSession.sharedInstance().recordPermission {
        case .undetermined:
            return .undetermined
        case .denied:
            return .denied
        case .granted:
            return .granted
        @unknown default:
            return .denied
        }
    }
    
    public func requestPermission(completion: @escaping () -> Void) {
        AVAudioSession.sharedInstance().requestRecordPermission { _ in
            DispatchQueue.main.async {
                completion()
            }
        }
    }
}

#endif
