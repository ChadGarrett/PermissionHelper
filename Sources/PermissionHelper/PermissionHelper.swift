//
//  File.swift
//  
//
//  Created by Chad Garrett on 2021/11/12.
//

/// Interface for checking and requesting different device permissions
public struct PermissionHelper {}

// - Mark

extension PermissionHelper {
    public enum PermissionType {
        case undetermined
        case granted
        case denied
    }
}

protocol PermissionHelperInterface: AnyObject {
    func getStatus() -> PermissionHelper.PermissionType
    
    /// Requests permission for the given feature and completes after the user has made a choice
    /// - Parameter completion: Callback to run after the user has set their permission
    func requestPermission(completion: @escaping () -> Void)
}
