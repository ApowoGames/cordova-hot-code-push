//
//  HCPEvents.m
//
//  Created by Nikolay Demyankov on 13.08.15.
//

#import "HCPEvents.h"

#pragma mark Event names declaration

NSString *const kHCPUpdateDownloadErrorEvent = @"chcp_updateLoadFailed";
NSString *const kHCPNothingToUpdateEvent = @"chcp_nothingToUpdate";
NSString *const kHCPUpdateIsReadyForInstallationEvent = @"chcp_updateIsReadyToInstall";
NSString *const kHCPBeforeInstallEvent = @"chcp_beforeInstall";
NSString *const kHCPUpdateInstallationErrorEvent = @"chcp_updateInstallFailed";
NSString *const kHCPUpdateIsInstalledEvent = @"chcp_updateInstalled";
NSString *const kHCPNothingToInstallEvent = @"chcp_nothingToInstall";
NSString *const kHCPBeforeBundleAssetsInstalledOnExternalStorageEvent = @"chcp_beforeAssetsInstalledOnExternalStorage";
NSString *const kHCPBundleAssetsInstalledOnExternalStorageEvent = @"chcp_assetsInstalledOnExternalStorage";
NSString *const kHCPBundleIsPluginReadyEvent = @"chcp_isPluginReady";
NSString *const kHCPBundleAssetsInstallationErrorEvent = @"chcp_assetsInstallationError";
NSString *const kHCPManifestDiffCompleteEvent = @"chcp_manifestDiffComplete";
NSString *const kHCPUpdateDownloadProgressEvent = @"chcp_updateDownloadProgressEvent";
NSString *const kHCPUpdateInstallProgressEvent = @"chcp_updateInstallProgressEvent";

NSString *const kHCPEventUserInfoErrorKey = @"error";
NSString *const kHCPEventUserInfoTaskIdKey = @"taskId";
NSString *const kHCPEventUserInfoApplicationConfigKey = @"appConfig";

@implementation HCPEvents

#pragma mark Public API

+ (NSNotification *)notificationWithName:(NSString *)name applicationConfig:(HCPApplicationConfig *)appConfig taskId:(NSString *)taskId {
    return [HCPEvents notificationWithName:name applicationConfig:appConfig taskId:taskId error:nil];
}

+ (NSNotification *)notificationWithName:(NSString *)name applicationConfig:(HCPApplicationConfig *)appConfig taskId:(NSString *)taskId data:(NSMutableDictionary *)data {
    return [HCPEvents notificationWithName:name applicationConfig:appConfig taskId:taskId error:nil data:data];
}

+ (NSNotification *)notificationWithName:(NSString *)name applicationConfig:(HCPApplicationConfig *)appConfig taskId:(NSString *)taskId error:(NSError *)error {
    NSMutableDictionary *userInfo = [[NSMutableDictionary alloc] init];
    if (appConfig) {
        userInfo[kHCPEventUserInfoApplicationConfigKey] = appConfig;
    }
    
    if (taskId) {
        userInfo[kHCPEventUserInfoTaskIdKey] = taskId;
    }
    
    if (error) {
        userInfo[kHCPEventUserInfoErrorKey] = error;
    }
    
    return [NSNotification notificationWithName:name object:nil userInfo:userInfo];
}

+ (NSNotification *)notificationWithName:(NSString *)name applicationConfig:(HCPApplicationConfig *)appConfig taskId:(NSString *)taskId error:(NSError *)error data:(NSMutableDictionary *)data {
    NSMutableDictionary *userInfo = [[NSMutableDictionary alloc] init];
    if (appConfig) {
        userInfo[kHCPEventUserInfoApplicationConfigKey] = appConfig;
    }
    
    if (taskId) {
        userInfo[kHCPEventUserInfoTaskIdKey] = taskId;
    }
    
    if (error) {
        userInfo[kHCPEventUserInfoErrorKey] = error;
    }

    if (data) {
        [userInfo addEntriesFromDictionary:data];
    }
    
    return [NSNotification notificationWithName:name object:nil userInfo:userInfo];
}

@end
