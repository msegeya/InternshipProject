//
//  ATMsModel.m
//  AssecoPraksa
//
//  Created by MTLab on 10/04/15.
//  Copyright (c) 2015 asseco. All rights reserved.
//

#import "ATMsModel.h"

@implementation ATMsModel


-(void) setValue:(id)value forKey:(NSString *)key
{
     //DLog(@"Undefined Key: %@", key);
    if([key isEqualToString:@"id"])
    {
        self.atmId = [value integerValue];
    }
    else if([key isEqualToString:@"address"])
    {
        
        ATMAddress *atm = [[ATMAddress alloc] initWithDictionary:value];
        self.address = atm;
        
    } else if( [key isEqualToString:@"working_hours"]){
        
        NSMutableArray *workingHours = [NSMutableArray array];
        
        [value enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL
                                                   *stop) {
            [workingHours addObject:[[WorkingHours alloc] initWithDictionary:obj]];
        }];
        
            self.hours = workingHours;
        
    }else
        [super setValue:value forKey:key];
}

@end
