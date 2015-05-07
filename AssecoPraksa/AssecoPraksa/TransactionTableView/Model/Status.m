//
//  Status.m
//  AssecoPraksa
//
//  Created by MTLab on 09/04/15.
//  Copyright (c) 2015 asseco. All rights reserved.
//

#import "Status.h"

@implementation Status


-(void) setValue:(id)value forKey:(NSString *)key
{
   // DLog(@"Defined Key: %@", key);
    
    if([key isEqualToString:@"description"])
    {

        self.statusDescription = value;
        
    }else 
        [super setValue:value forKey:key];
}



-(void) setValue:(id)value forUndefinedKey:(NSString *)key
{
    //DLog(@"UNDefined Key: %@", key);

    if([key isEqualToString:@"effective_date"])
    {
        NSDateFormatter *formater = [[NSDateFormatter alloc]init];
        [formater setDateFormat:@"dd-MM-yyyy HH:mm:ss.SSS zzz"];
        NSDate *date;
        date = [formater dateFromString:value];
        
        self.effectiveDate = date;
        
    }else
        [super setValue:value forKey:key];
    
}

@end
