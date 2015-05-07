//
//  ExchangeRateController.h
//  AssecoPraksa
//
//  Created by MTLab on 13/04/15.
//  Copyright (c) 2015 asseco. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "APILayer.h"
#import "ExchangeRateCell.h"
#import "ExchangeRateModel.h"


@interface ExchangeRateController : UIViewController <UITableViewDataSource, UITableViewDelegate, APIResponsDelegate>

@property (strong,nonatomic) NSArray* dataSource;


@property (strong, nonatomic) IBOutlet UITableView *tableView;

@end
