//
//  ExchangeRateModel.m
//  AssecoPraksa
//
//  Created by MTLab on 10/04/15.
//  Copyright (c) 2015 asseco. All rights reserved.
//

#import "ExchangeRateModel.h"

@implementation ExchangeRateModel



- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    //DLog(@"Undefined Key: %@", key);
    
    if([key isEqualToString:@"currency_code"]){
        
        self.currencyCode = value;
    }
    else if([key isEqualToString:@"country_name"])
    {
        self.countyName = value;

    }else if([key isEqualToString:@"country_code"])
    {
        self.countryCode = value;
    }
     else
         [super setValue:value forKey:key];
}

@end
