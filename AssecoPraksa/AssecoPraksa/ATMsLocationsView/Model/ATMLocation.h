//
//  ATMLocation.h
//  AssecoPraksa
//
//  Created by MTLab on 10/04/15.
//  Copyright (c) 2015 asseco. All rights reserved.
//

#import "JSONModel.h"
#import <CoreLocation/CoreLocation.h>

@interface ATMLocation : JSONModel

@property (strong,nonatomic) CLLocation *atmsLocation;

-(id) initWithLocation:(NSMutableDictionary*) location;

@end
