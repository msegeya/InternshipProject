//
//  Currency.h
//  AssecoPraksa
//
//  Created by MTLab on 08/04/15.
//  Copyright (c) 2015 asseco. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSONModel.h"
@interface Currency : JSONModel

@property (strong,nonatomic) NSString *code;
@property NSInteger amount;


@end
