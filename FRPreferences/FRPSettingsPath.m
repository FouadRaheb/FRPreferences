//
//  FRPSettingsPath.m
//  FRPreferences
//
//  Created by Fouad Raheb on 5/5/15.
//  Copyright (c) 2015 F0u4d. All rights reserved.
//

#import "FRPSettingsPath.h"

@interface FRPSettings ()
typedef void(^FRPSettingValueDidChangeBlock)(void);
@property (nonatomic, copy) FRPSettingValueDidChangeBlock valueDidChangeBlock;
@property (nonatomic, strong) NSMutableDictionary *dict;
@end

@implementation FRPSettings

+ (instancetype)settingsWithKey:(NSString *)key defaultValue:(id)defaultValue {
    return [[self alloc] initWithKey:key defaultValue:defaultValue];
}

- (instancetype)initWithKey:(NSString *)key defaultValue:(id)defaultValue {
    if (self = [super init]) {
        self.key = key;
        if ([[[NSUserDefaults standardUserDefaults] objectForKey:@"FRPrefsReadWriteFromPlist"] boolValue]) {
            NSLog(@"Settings Read Write From Plist");
            self.readWriteFromPlist = YES;
        }
        if ([[[NSUserDefaults standardUserDefaults] objectForKey:@"FRPrefsReadWriteFromPlistPath"] length] > 0) {
            self.fileSave = [[NSUserDefaults standardUserDefaults] objectForKey:@"FRPrefsReadWriteFromPlistPath"];
            self.dict = [NSMutableDictionary dictionaryWithContentsOfFile:self.fileSave];
            NSLog(@"Settings File Save: %@",self.fileSave);
        }
    }
    
    return self;
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    self.value = [change objectForKey:@"new"];
    if (self.valueDidChangeBlock) {
        self.valueDidChangeBlock();
    }
}

- (id)value {
    if ([self.fileSave length] > 0) {
        return [self getPlistValue];
    }
    return nil;
}

- (void)setValue:(id)value {
    if (self.value != value && [self.fileSave length] > 0) {
        [self savePlistValue:value];
    }
}

-(void)savePlistValue:(id)value {
    if (self.dict == nil) self.dict = [[NSMutableDictionary alloc] initWithContentsOfFile:self.fileSave];
    if (self.dict == nil) self.dict = [NSMutableDictionary new];
    [self.dict setObject:value forKey:self.key];
    [self.dict writeToFile:self.fileSave atomically:YES];
}

-(id)getPlistValue {
    if (self.dict == nil) self.dict = [[NSMutableDictionary alloc] initWithContentsOfFile:self.fileSave];
    if (self.dict == nil) self.dict = [NSMutableDictionary new];
    return [self.dict objectForKey:self.key];
}

- (void)dealloc {
    self.dict = nil;
}

+(void)setReadValuesFromPlist:(BOOL)readwrite atPath:(NSString *)path {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:[NSNumber numberWithBool:readwrite] forKey:@"FRPrefsReadWriteFromPlist"];
    [defaults setObject:path forKey:@"FRPrefsReadWriteFromPlistPath"];
    [defaults synchronize];
}

@end


