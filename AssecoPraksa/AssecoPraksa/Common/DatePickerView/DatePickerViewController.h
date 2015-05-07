//
//  DatePickerViewController.h
//  AssecoPraksa
//
//  Created by MTLab on 28/04/15.
//  Copyright (c) 2015 asseco. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol DatePickerDelegatge

-(void)getPickedDate:(NSDate*)date;

@end

@interface DatePickerViewController : UIViewController

@property (strong,nonatomic) id<DatePickerDelegatge> delagate;

@end
