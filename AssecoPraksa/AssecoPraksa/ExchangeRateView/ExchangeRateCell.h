//
//  ExchangeRateCell.h
//  AssecoPraksa
//
//  Created by MTLab on 13/04/15.
//  Copyright (c) 2015 asseco. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ExchangeRateCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UILabel *currencyCode;
@property (strong, nonatomic) IBOutlet UILabel *middleRate;
@property (strong, nonatomic) IBOutlet UILabel *buyRate;
@property (strong, nonatomic) IBOutlet UILabel *sellRate;

@end
