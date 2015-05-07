//
//  Account.h
//  AssecoPraksa
//
//  Created by MTLab on 08/04/15.
//  Copyright (c) 2015 asseco. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Currency.h"
#import "JSONModel.h"

@interface Account : JSONModel

@property (strong,nonatomic) NSString *accountnumber;
@property (strong,nonatomic) Currency *currency;


@end
