//
//  NXZDataStore.m
//  DataStore
//
//  Created by 众力金融 on 2019/1/8.
//  Copyright © 2019年 众力金融. All rights reserved.
//

#import "NXZDataStore.h"
#import <Security/Security.h>


@implementation NXZDataStore

+ (NSMutableDictionary *)keychainQuery:(NSString *)key
{
    if (key) {
        return [NSMutableDictionary dictionaryWithObjectsAndKeys:(__bridge id)(kSecClassGenericPassword) ,kSecClass,
                key,kSecAttrService,
                key,kSecAttrAccount
                ,kSecAttrAccessibleAfterFirstUnlock,kSecAttrAccessible, nil];
    }
    return nil;
    
}

+ (void)Add:(NSString *)key data:(NSData *)data
{
    if (key && data != nil) {
        NSMutableDictionary *keychainQuery = [self keychainQuery:key];
        SecItemDelete((CFDictionaryRef)keychainQuery);
        [keychainQuery setObject:data forKey:(id)kSecValueData];
        OSStatus status = SecItemAdd((CFDictionaryRef)keychainQuery, NULL);
        if (status == noErr) {
            NSLog(@"添加success");
        }else {
            NSLog(@"添加error");
        }
    }
}

+ (void)Delete:(NSString *)key
{
    if (key) {
        NSMutableDictionary *keychainQuery = [self keychainQuery:key];
       OSStatus status = SecItemDelete((CFDictionaryRef)keychainQuery);
        if (status == noErr) {
            NSLog(@"删除success");
        }else {
            NSLog(@"删除error");
        }
    }
}

+ (NSData *)query:(NSString *)key
{
     CFDataRef data = NULL;
     NSData *backData = nil;
    if (key) {
        NSMutableDictionary *keychainQuery = [self keychainQuery:key];
        [keychainQuery setObject:(id)kCFBooleanTrue forKey:(__bridge_transfer id)kSecReturnData];
        OSStatus status = SecItemCopyMatching((CFDictionaryRef)keychainQuery, (CFTypeRef *)&data);
        if (status == noErr) {
            NSLog(@"读取success");
            backData = (__bridge NSData *)data;
        }else {
            NSLog(@"读取error");
        }
    }
    return backData;
}

@end
