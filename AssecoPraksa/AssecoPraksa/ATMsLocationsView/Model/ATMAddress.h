//
//  ATMsAddress.h
//  AssecoPraksa
//
//  Created by MTLab on 10/04/15.
//  Copyright (c) 2015 asseco. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "ATMLocation.h"

@interface ATMAddress : JSONModel


@property (strong,nonatomic) NSString *street;
@property (strong,nonatomic) NSString *city;
@property (strong,nonatomic) NSString *place;
@property (strong,nonatomic) NSString *building;
@property (strong,nonatomic) NSString *placeName;
@property (strong,nonatomic) NSString *countryCode;
@property (strong,nonatomic) NSString *countryName;
@property (strong,nonatomic) ATMLocation *atmLocation;




@end
