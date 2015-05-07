//
//  JSONModel.m
//  AssecoPraksa
//
//  Created by MTLab on 08/04/15.
//  Copyright (c) 2015 asseco. All rights reserved.
//

#import "JSONModel.h"

@implementation JSONModel


-(id) initWithDictionary:(NSMutableDictionary*) jsonObject
{
    if((self = [super init]))
    {
        self = [self init];
        [self setValuesForKeysWithDictionary:jsonObject];
    }
    return self;
}




-(id)mutableCopyWithZone:(NSZone *)zone{
    return nil;
}

-(id)copyWithZone:(NSZone *)zone{
    return nil;
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key  {
    DLog(@"Undefined Key: %@", key);
}

@end
