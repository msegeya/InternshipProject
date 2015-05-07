//
//  ExchangeRateModel.h
//  AssecoPraksa
//
//  Created by MTLab on 10/04/15.
//  Copyright (c) 2015 asseco. All rights reserved.
//

#import "JSONModel.h"

@interface ExchangeRateModel : JSONModel

@property (strong,nonatomic) NSString *countryCode;
@property (strong,nonatomic) NSString *countyName;
@property (strong,nonatomic) NSString *currencyCode;
@property (strong,nonatomic) NSString *buy;
@property (strong,nonatomic) NSString *middle;
@property (strong,nonatomic) NSString *sell;



@end
