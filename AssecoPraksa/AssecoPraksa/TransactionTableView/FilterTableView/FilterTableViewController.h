//
//  FilterTableViewController.h
//  AssecoPraksa
//
//  Created by MTLab on 28/04/15.
//  Copyright (c) 2015 asseco. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DatePickerViewController.h"
#import "TableListPickerController.h"   
#import "FilterData.h"
@protocol FilterDataDelegate

-(void)returnFilteredData:(FilterData*)data;
@end
@interface FilterTableViewController : UITableViewController <DatePickerDelegatge,TableListPickerDelegate,UITextFieldDelegate>

@property (nonatomic,strong) NSArray *accNumbers;

@property (nonatomic,strong) id<FilterDataDelegate> delegate;

@end
