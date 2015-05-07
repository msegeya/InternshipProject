//
//  Account.m
//  AssecoPraksa
//
//  Created by MTLab on 08/04/15.
//  Copyright (c) 2015 asseco. All rights reserved.
//

#import "Account.h"

@implementation Account


-(void) setValue:(id)value forKey:(NSString *)key
{
    // DLog(@"Undefined Key: %@", key);
    if([key isEqualToString:@"currency"])
    {
        
        Currency *cr = [[Currency alloc] initWithDictionary:value];
        self.currency = cr;
        
    } else
        [super setValue:value forKey:key];
}

@end
