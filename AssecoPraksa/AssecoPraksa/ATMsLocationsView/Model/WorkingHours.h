//
//  WorkingHours.h
//  AssecoPraksa
//
//  Created by MTLab on 10/04/15.
//  Copyright (c) 2015 asseco. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSONModel.h"

@interface WorkingHours : JSONModel

@property (strong,nonatomic) NSString *period_description;
@property (strong,nonatomic) NSString *working_time;

@end
