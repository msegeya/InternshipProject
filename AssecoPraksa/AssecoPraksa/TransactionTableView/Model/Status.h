//
//  Status.h
//  AssecoPraksa
//
//  Created by MTLab on 09/04/15.
//  Copyright (c) 2015 asseco. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSONModel.h"
@interface Status : JSONModel

@property (strong,nonatomic) NSString *code;
@property (strong,nonatomic)  NSString *statusDescription;
@property (strong,nonatomic)  NSDate *effectiveDate;

@end
