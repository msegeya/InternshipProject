//
//  ATMsMapsViewController.h
//  AssecoPraksa
//
//  Created by MTLab on 13/04/15.
//  Copyright (c) 2015 asseco. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "APILayer.h"
#import "ATMsLocationNavigationController.h"
#import  <CoreLocation/CoreLocation.h>
#import <GoogleMaps/GoogleMaps.h>

@interface ATMsMapsViewController : UIViewController <APIResponsDelegate,CLLocationManagerDelegate,GMSMapViewDelegate>




@end
