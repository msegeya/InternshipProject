//
//  Creditor.h
//  AssecoPraksa
//
//  Created by MTLab on 09/04/15.
//  Copyright (c) 2015 asseco. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSONModel.h"
@interface TransactionUser : JSONModel

@property (strong,nonatomic) NSString *name;
@property (strong,nonatomic) NSString *address;
@property (strong,nonatomic) NSString *city;

@end
