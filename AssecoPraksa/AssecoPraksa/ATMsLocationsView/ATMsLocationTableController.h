//
//  ATMsLocationTableController.h
//  AssecoPraksa
//
//  Created by MTLab on 14/04/15.
//  Copyright (c) 2015 asseco. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ATMsLocationNavigationController.h"
#import "ATMLocationsCell.h"

@interface ATMsLocationTableController : UITableViewController <ATMsLocationDataProtocol,CLLocationManagerDelegate>


@property (strong,nonatomic) NSArray *atmsLocations; //protocol property

@end
