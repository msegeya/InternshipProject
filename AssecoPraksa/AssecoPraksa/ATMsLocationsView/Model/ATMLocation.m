//
//  ATMLocation.m
//  AssecoPraksa
//
//  Created by MTLab on 10/04/15.
//  Copyright (c) 2015 asseco. All rights reserved.
//

#import "ATMLocation.h"

@implementation ATMLocation


-(id) initWithLocation:(NSMutableDictionary*) location
{
    self = [self init];
    
    CLLocationDegrees lat = [[location valueForKey:@"lng"]doubleValue];
    CLLocationDegrees lng = [[location valueForKey:@"lat"]doubleValue];
    
    
    self.atmsLocation = [[CLLocation alloc] initWithLatitude:lat longitude:lng];
    
    return self;
}

@end
