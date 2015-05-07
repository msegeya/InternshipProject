//
//  ATMsLocationNavigationController.m
//  AssecoPraksa
//
//  Created by MTLab on 14/04/15.
//  Copyright (c) 2015 asseco. All rights reserved.
//

#import "ATMsLocationNavigationController.h"

@interface ATMsLocationNavigationController ()
{
    UserData *user;
}
@property (strong,nonatomic) APILayer *api;
@end

@implementation ATMsLocationNavigationController

-(void)viewDidLoad{
    [super viewDidLoad];
    
    
    
    
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    id<ATMsLocationDataProtocol> destinetionViewController;
    NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
    
    if(indexPath.row == 1){
        //the destination controller is the rootViewController of the Navigation
        destinetionViewController = [[[segue destinationViewController]viewControllers]objectAtIndex:0];
    }else{
        destinetionViewController = [segue destinationViewController];
    }
    [destinetionViewController setLocationDataWithArray:self.atmsLocations];
    
    
}

-(void)responseATMsRecivedWithArray:(NSArray *)array
{
    self.atmsLocations = array;
    
    
    //self.api requestGoogleDistanceWithOrigni:<#(CLLocationCoordinate2D)#> andDestination:<#(CLLocationCoordinate2D)#>
    
    
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
}
@end
