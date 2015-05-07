//
//  ATMsLocationNavigationController.h
//  AssecoPraksa
//
//  Created by MTLab on 14/04/15.
//  Copyright (c) 2015 asseco. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "APILayer.h"

@protocol ATMsLocationDataProtocol <NSObject>
@required
@property (strong,nonatomic) NSArray *atmsLocations;

-(void)setLocationDataWithArray:(NSArray*)array;

@end

@interface ATMsLocationNavigationController : UITableViewController <APIResponsDelegate>
@property (strong,nonatomic) NSArray *atmsLocations;
@end
