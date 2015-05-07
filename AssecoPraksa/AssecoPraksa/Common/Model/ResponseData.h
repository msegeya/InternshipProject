//
//  User.h
//  AssecoPraksa
//
//  Created by MTLab on 08/04/15.
//  Copyright (c) 2015 asseco. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Account.h"
#import "JSONModel.h"

@interface ResponseData : JSONModel


@property (strong, nonatomic) NSString *token;
@property (strong,nonatomic)  NSString *name;
@property BOOL status;
@property (strong,nonatomic) NSString *message;
@property (strong,nonatomic) Account *account;


@end
