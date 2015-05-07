//
//  ProfileInfoViewController.h
//  AssecoPraksa
//
//  Created by MTLab on 09/04/15.
//  Copyright (c) 2015 asseco. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "APILayer.h"
#import "TransactionCell.h"
#import "TransactionDetailViewController.h"
#import "FilterTableViewController.h"

@interface TransactionsTableViewController : UIViewController <UITableViewDataSource,UITableViewDelegate,APIResponsDelegate,FilterDataDelegate,UISearchBarDelegate,UISearchDisplayDelegate>

@property (strong,nonatomic) NSArray *datasouce;

@property (strong, nonatomic) IBOutlet UITableView *tableView;


@end
