//
//  FRPSettings.h
//  FRPreferences
//
//  Created by Fouad Raheb on 5/5/15.
//  Copyright (c) 2015 F0u4d. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FRPSettings : NSObject

@property (nonatomic, assign) NSString *key;
@property (nonatomic, assign) id value;
@property (nonatomic, assign) NSString *fileSave;

+ (instancetype)settingsWithKey:(NSString *)key defaultValue:(id)defaultValue;
@end
