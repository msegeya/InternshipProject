//
//  TransactionCell.h
//  AssecoPraksa
//
//  Created by MTLab on 09/04/15.
//  Copyright (c) 2015 asseco. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TransactionCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UILabel *address;
@property (strong, nonatomic) IBOutlet UILabel *creditorName;

@property (strong, nonatomic) IBOutlet UILabel *creditorAccNumber;
@property (strong, nonatomic) IBOutlet UILabel *valueDate;

@property (strong, nonatomic) IBOutlet UILabel *paymentDescription;
@end
