//
//  ATMsModel.h
//  AssecoPraksa
//
//  Created by MTLab on 10/04/15.
//  Copyright (c) 2015 asseco. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ATMAddress.h"
#import "WorkingHours.h"

@interface ATMsModel : JSONModel

@property NSInteger atmId;
@property (strong,nonatomic) NSString *type;
@property (strong,nonatomic) ATMAddress *address;
@property (strong,nonatomic) NSArray *hours;

@end
