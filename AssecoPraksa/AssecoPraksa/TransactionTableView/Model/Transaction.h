//
//  Transaction.h
//  AssecoPraksa
//
//  Created by MTLab on 09/04/15.
//  Copyright (c) 2015 asseco. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TransactionUser.h"
#import "Currency.h"
#import "Status.h"


@interface Transaction : JSONModel

@property (strong,nonatomic) NSString *transferId;
@property (strong,nonatomic) TransactionUser *creditor;
@property (strong,nonatomic) TransactionUser *debtor;
@property (strong,nonatomic) NSString *creditorAccountNumber;
@property (strong,nonatomic) NSString *deptorAccountNumber;
@property (strong,nonatomic) NSString *paymentDescription;
@property (strong,nonatomic) NSString *transferType;
@property (strong,nonatomic) Currency *currency;
@property (strong,nonatomic) NSDate *valueDate;
@property (strong,nonatomic) NSDate *postedDate;
@property (strong,nonatomic) NSDate *executedDate;
@property BOOL debit;
@property (strong,nonatomic) Status *status;
@property BOOL has_picture;


@end
