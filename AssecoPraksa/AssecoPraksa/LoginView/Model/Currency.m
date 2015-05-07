//
//  Currency.m
//  AssecoPraksa
//
//  Created by MTLab on 08/04/15.
//  Copyright (c) 2015 asseco. All rights reserved.
//

#import "Currency.h"

@implementation Currency

- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
     if([key isEqualToString:@"amount"])
         self.amount = [value integerValue];
  
     else
     [super setValue:value forKey:key];    
}

@end
