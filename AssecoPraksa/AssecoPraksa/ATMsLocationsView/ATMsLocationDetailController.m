//
//  ATMsLocationDetailController.m
//  AssecoPraksa
//
//  Created by MTLab on 14/04/15.
//  Copyright (c) 2015 asseco. All rights reserved.
//

#import "ATMsLocationDetailController.h"
#import "APILayer.h"

@interface ATMsLocationDetailController ()
{
    APILayer *api;
}

@property (strong, nonatomic) IBOutlet UILabel *atm;
@property (strong, nonatomic) IBOutlet UILabel *distance;

@property (strong, nonatomic) IBOutlet UILabel *workHoursMonFri;
@property (strong, nonatomic) IBOutlet UILabel *workHoursSat;

@property (strong, nonatomic) IBOutlet UIImageView *logo;
@end

@implementation ATMsLocationDetailController


-(void)viewDidLoad
{
    [super viewDidLoad];
    
    self.atm.text =  [NSString stringWithFormat:@"%@ %@, %@ %@",
                      self.atmModel.address.street,self.atmModel.address.building, self.atmModel.address.city, self.atmModel.address.place];
    
    WorkingHours *monFri = self.atmModel.hours[0];
    WorkingHours *sat = self.atmModel.hours[1];
    
    self.workHoursMonFri.text =monFri.working_time;
    self.workHoursSat.text =sat.working_time;
    
    if([self.atmModel.type isEqualToString:@"Branch"])
    {
        self.logo.image = [UIImage imageNamed:@"bankLogo"];
    }
    
    api = [[APILayer alloc]initWithView:self.view];
    api.delegate = self;
    
    CLLocation *cl = self.atmModel.address.atmLocation.atmsLocation;
    
    [api requestGoogleDistanceWithOrigni:self.userLocation andDestination:cl.coordinate];
}

-(void)responseGoogleDistanceWithData:(NSString*)data
{
    self.distance.text = data;
    [self.view setNeedsDisplay];
}

@end
