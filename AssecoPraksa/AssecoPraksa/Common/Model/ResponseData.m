//
//  User.m
//  AssecoPraksa
//
//  Created by MTLab on 08/04/15.
//  Copyright (c) 2015 asseco. All rights reserved.
//

#import "ResponseData.h"

@implementation ResponseData

/*
- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    //DLog(@"Undefined Key: %@", key);
    
    if([key isEqualToString:@"id"])
     
    if([key isEqualToString:@"description"])
        
    else
        [super setValue:value forKey:key];
    ￼￼

}
*/

-(void) setValue:(id)value forKey:(NSString *)key
{
   // DLog(@"Defined Key: %@", key);
    if([key isEqualToString:@"account"])
    {
            Account *acc = [[Account alloc] initWithDictionary:value];
            self.account = acc;
        
    } else
        [super setValue:value forKey:key];
}

@end
