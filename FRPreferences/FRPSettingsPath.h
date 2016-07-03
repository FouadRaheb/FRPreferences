//
//  FRPSettingsPath.h
//  FRPreferences
//
//  Created by Fouad Raheb on 8/13/15.
//  Copyright (c) 2015 F0u4d. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FRPSettings : NSObject

@property (nonatomic, assign) NSString *key;
@property (nonatomic, assign) id value;

@property (nonatomic, assign) NSString *fileSave;
@property (nonatomic, assign) BOOL readWriteFromPlist;

+ (instancetype)settingsWithKey:(NSString *)key defaultValue:(id)defaultValue;
+(void)setReadValuesFromPlist:(BOOL)readwrite atPath:(NSString *)path;
@end
