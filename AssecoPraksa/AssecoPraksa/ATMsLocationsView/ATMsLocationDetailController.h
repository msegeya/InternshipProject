//
//  ATMsLocationDetailController.h
//  AssecoPraksa
//
//  Created by MTLab on 14/04/15.
//  Copyright (c) 2015 asseco. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ATMsModel.h"
#import "APILayer.h"

@interface ATMsLocationDetailController : UITableViewController <APIResponsDelegate>

@property (strong,nonatomic) ATMsModel *atmModel;

@property CLLocationCoordinate2D userLocation;

@end
