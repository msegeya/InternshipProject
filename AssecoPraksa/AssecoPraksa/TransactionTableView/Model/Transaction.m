//
//  Transaction.m
//  AssecoPraksa
//
//  Created by MTLab on 09/04/15.
//  Copyright (c) 2015 asseco. All rights reserved.
//

#import "Transaction.h"

@implementation Transaction


-(void) setValue:(id)value forKey:(NSString *)key
{
   // DLog(@"Defined Key: %@", key);

    if([key isEqualToString:@"currency"])
    {
        Currency *cr = [[Currency alloc] initWithDictionary:value];
        self.currency = cr;
        
    }
    else if ([key isEqualToString:@"creditor"])
    {
        TransactionUser *creditor = [[TransactionUser alloc]initWithDictionary:value];
        self.creditor = creditor;
    }
    else if ([key isEqualToString:@"debtor"])
    {

        TransactionUser *deptor = [[TransactionUser alloc]initWithDictionary:value];
        self.debtor = deptor;
    }
    else if ([key isEqualToString:@"status"])
    {
        Status *status = [[Status alloc]initWithDictionary:value];
        self.status = status;
    }
    else
    [super setValue:value forKey:key];
}


-(void) setValue:(id)value forUndefinedKey:(NSString *)key
{
    //DLog(@"UNDefined Key: %@", key);
    
    NSDateFormatter *formater = [[NSDateFormatter alloc]init];
    [formater setDateFormat:@"dd-MM-yyyy HH:mm:ss.SSS zzz"];
    NSDate *date;
    
    if([key isEqualToString:@"transfer_id"])
    {
        
        self.transferId = value;
        
    }else if ([key isEqualToString:@"creditor_account_number"])
    {
        self.creditorAccountNumber = value;
    }
    else if ([key isEqualToString:@"debtor_account_number"])
    {
        self.deptorAccountNumber = value;
    }
    else if ([key isEqualToString:@"payment_description"])
    {
        self.paymentDescription = value;
    }
    else if ([key isEqualToString:@"transfer_type"])
    {
        self.transferType = value;
    }
    else if ([key isEqualToString:@"value_date"])
    {
        date = [formater dateFromString:value];
        
        self.valueDate = date;
    }
    else if ([key isEqualToString:@"posted_date"])
    {
        date = [formater dateFromString:value];
        self.postedDate = date;
    }
    else if ([key isEqualToString:@"executed_date"])
    {
        date = [formater dateFromString:value];
        self.executedDate = date;
    }else
        [super setValue:value forKey:key];
}

@end
