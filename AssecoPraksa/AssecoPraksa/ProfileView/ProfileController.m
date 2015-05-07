//
//  ProfileController.m
//  AssecoPraksa
//
//  Created by MTLab on 17/04/15.
//  Copyright (c) 2015 asseco. All rights reserved.
//

#import "ProfileController.h"
#import "ProfileTableController.h"

@interface ProfileController ()

@property (strong, nonatomic) IBOutlet UIImageView *profileImg;

@property (strong, nonatomic) IBOutlet UIView *tableView;

@end

@implementation ProfileController


-(void)viewDidLoad
{
    [super viewDidLoad];
    
    self.profileImg.layer.cornerRadius = 150;
    self.profileImg.layer.masksToBounds = YES;
    
    ProfileTableController *ptc = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"ProfileTableController"];
    
    [self addChildViewController:ptc];
    ptc.view.frame = self.tableView.bounds;
    [self.tableView addSubview:ptc.view];
    [ptc didMoveToParentViewController:self];
}



@end
