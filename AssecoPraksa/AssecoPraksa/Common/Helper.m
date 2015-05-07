//
//  Helper.m
//  AssecoPraksa
//
//  Created by MTLab on 16/04/15.
//  Copyright (c) 2015 asseco. All rights reserved.
//

#import "Helper.h"

@implementation Helper

+(NSString *)getValueFromPlistForKey:(NSString *)key
{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"ASConfigList" ofType:@"plist"];
    NSDictionary *dict = [NSDictionary dictionaryWithContentsOfFile:path];

    
    NSString *value = [dict objectForKey:key];
    
    return value;
}

@end
