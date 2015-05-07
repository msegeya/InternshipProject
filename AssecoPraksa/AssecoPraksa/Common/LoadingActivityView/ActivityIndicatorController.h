//
//  LoadingActivityController.h
//  AssecoPraksa
//
//  Created by MTLab on 16/04/15.
//  Copyright (c) 2015 asseco. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ActivityIndicatorController : UIViewController

@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;
@property (strong, nonatomic) IBOutlet UIView *bezelView;
@property (strong, nonatomic) IBOutlet UILabel *loadingText;

-(void)startActivityIndicatorWithNetwork:(BOOL)network;
-(void)stopActivityIndicator;
-(instancetype)initWithNibName:(NSString *)nibNameOrNil withMainView:(UIView *)mView;

@end
