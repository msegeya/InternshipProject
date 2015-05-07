//
//  TableListPickerController.h
//  AssecoPraksa
//
//  Created by MTLab on 29/04/15.
//  Copyright (c) 2015 asseco. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol TableListPickerDelegate

-(void)getPickedAccountNumber:(NSString*)accNUmber;
@end

@interface TableListPickerController : UIViewController <UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) NSArray *dataSource;
@property (strong,nonatomic) id<TableListPickerDelegate> delagate;
@end
