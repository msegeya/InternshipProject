//
//  ATMsAddress.m
//  AssecoPraksa
//
//  Created by MTLab on 10/04/15.
//  Copyright (c) 2015 asseco. All rights reserved.
//

#import "ATMAddress.h"

@implementation ATMAddress


-(void) setValue:(id)value forKey:(NSString *)key
{
    // DLog(@"defined Key: %@", key);
    if([key isEqualToString:@"location"])
    {
        
        ATMLocation *l = [[ATMLocation alloc] initWithLocation:value];
        self.atmLocation = l;
        
    }else
    [super setValue:value forKey:key];
}

-(void) setValue:(id)value forUndefinedKey:(NSString *)key
{
    //DLog(@"Undefined Key: %@", key);
    if([key isEqualToString:@"country_code"])
    {
        self.countryCode = value;
        
    } else if( [key isEqualToString:@"country_name"]){
        
        self.countryName  = value;
        
    }
    else if( [key isEqualToString:@"place_name"]){
        
        self.placeName  = value;
        
    }
    else
    [super setValue:value forKey:key];
}

@end
