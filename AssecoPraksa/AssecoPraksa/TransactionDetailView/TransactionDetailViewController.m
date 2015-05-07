//
//  TransactionDetailViewController.m
//  AssecoPraksa
//
//  Created by MTLab on 10/04/15.
//  Copyright (c) 2015 asseco. All rights reserved.
//

#import "TransactionDetailViewController.h"

@interface TransactionDetailViewController ()


@property (strong, nonatomic) IBOutlet UILabel *creditorName;
@property (strong, nonatomic) IBOutlet UILabel *creditorAddress;
@property (strong, nonatomic) IBOutlet UILabel *creditorCity;
@property (strong, nonatomic) IBOutlet UILabel *creditorAccNumber;

@property (strong, nonatomic) IBOutlet UILabel *debtorName;
@property (strong, nonatomic) IBOutlet UILabel *debtorAdress;
@property (strong, nonatomic) IBOutlet UILabel *debtorCity;
@property (strong, nonatomic) IBOutlet UILabel *debtorAccNumber;

@property (strong, nonatomic) IBOutlet UILabel *transferType;
@property (strong, nonatomic) IBOutlet UILabel *transferId;
@property (strong, nonatomic) IBOutlet UILabel *paymentDescription;
@property (strong, nonatomic) IBOutlet UILabel *amount;
@property (strong, nonatomic) IBOutlet UILabel *currency;
@property (strong, nonatomic) IBOutlet UILabel *valueDate;
@property (strong, nonatomic) IBOutlet UILabel *postedDate;
@property (strong, nonatomic) IBOutlet UILabel *executedDate;
@property (strong, nonatomic) IBOutlet UILabel *debit;

@property (strong, nonatomic) IBOutlet UILabel *state;
@property (strong, nonatomic) IBOutlet UILabel *statusDescription;
@property (strong, nonatomic) IBOutlet UILabel *effectiveDate;



@end

@implementation TransactionDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSDateFormatter *formater = [[NSDateFormatter alloc]init];
    [formater setDateFormat:@"dd/MM/yyy at HH:mm:ss zzz"];
    

    
    self.creditorAccNumber.text = self.transaction.creditorAccountNumber;
    self.creditorAddress.text = self.transaction.creditor.address;
    self.creditorCity.text = self.transaction.creditor.city;
    self.creditorName.text = self.transaction.creditor.name;

    self.debtorAccNumber.text = self.transaction.deptorAccountNumber;
    self.debtorAdress.text = self.transaction.debtor.address;
    self.debtorCity.text = self.transaction.debtor.city;
    self.debtorName.text = self.transaction.debtor.name;
    
    self.transferId.text = self.transaction.transferId;
    self.transferType.text = self.transaction.transferType;
    self.paymentDescription.text = self.transaction.paymentDescription;
    self.amount.text =  [@(self.transaction.currency.amount) stringValue];
    self.currency.text = self.transaction.currency.code;
    self.valueDate.text = [formater stringFromDate: self.transaction.valueDate];
    self.postedDate.text = [formater stringFromDate: self.transaction.postedDate];
    self.executedDate.text = [formater stringFromDate: self.transaction.executedDate];
    self.debit.text = self.transaction.debit ? @"YES" : @"NO";
    
    self.state.text = self.transaction.status.code;
    self.statusDescription.text = self.transaction.status.statusDescription;
    self.effectiveDate.text = [formater stringFromDate: self.transaction.status.effectiveDate];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
