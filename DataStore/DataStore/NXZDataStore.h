//
//  NXZDataStore.h
//  DataStore
//
//  Created by 众力金融 on 2019/1/8.
//  Copyright © 2019年 众力金融. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NXZDataStore : NSObject

/**
 保存数据

 @param key 存储key
 @param data 存储的data
 */
+ (void)Add:(NSString *)key data:(NSData *)data;

/**
 删除数据

 @param key 标识key
 */
+ (void)Delete:(NSString *)key;


/**
 查询数据

 @param key 标识key
 @return 返回查询的数据
 */
+ (NSData *)query:(NSString *)key;



@end

NS_ASSUME_NONNULL_END
