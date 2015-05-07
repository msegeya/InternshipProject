//
//  LoadingActivityController.m
//  AssecoPraksa
//
//  Created by MTLab on 16/04/15.
//  Copyright (c) 2015 asseco. All rights reserved.
//

#import "ActivityIndicatorController.h"
#import <QuartzCore/QuartzCore.h>

@interface ActivityIndicatorController ()
{
    UIView *mainView;
    
}

@end

@implementation ActivityIndicatorController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.bezelView.layer.cornerRadius = 15;
    self.bezelView.layer.masksToBounds = YES;
    
    
    
    [self.view setCenter:CGPointMake(CGRectGetMidX([mainView bounds]), CGRectGetMidY([mainView bounds]))];
    
    
    float x =mainView.bounds.origin.x;
    float y = mainView.bounds.origin.y;
    float width = mainView.bounds.size.width;
    float height = mainView.bounds.size.height;
    
    
    [self.view setFrame:CGRectMake(x, y, width, height)];
    // cell.center = self.view.center;
    //[self.view addSubview:cell];
}

-(instancetype)initWithNibName:(NSString *)nibNameOrNil withMainView:(UIView *)mView
{
    self = [super initWithNibName:nibNameOrNil bundle:nil];
    
    mainView = mView;
    
    return self;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)startActivityIndicatorWithNetwork:(BOOL)network
{
    if(network)
        [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    
    [mainView addSubview:self.view];
    [self.activityIndicator startAnimating];
}
-(void)stopActivityIndicator
{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    
    [self.view removeFromSuperview];
    [self.activityIndicator stopAnimating];
}

@end
