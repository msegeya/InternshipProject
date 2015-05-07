//
//  ATMsLocationTableController.m
//  AssecoPraksa
//
//  Created by MTLab on 14/04/15.
//  Copyright (c) 2015 asseco. All rights reserved.
//

#import "ATMsLocationTableController.h"
#import "ATMsModel.h"
#import "ATMsLocationDetailController.h"

@interface ATMsLocationTableController ()
@property (nonatomic,retain) CLLocationManager *locationManager;
@end

@implementation ATMsLocationTableController

-(void)viewDidLoad{
    [super viewDidLoad];
    
    
#ifdef __IPHONE_8_0
    if(IS_OS_8_OR_LATER) {
        [self.locationManager requestWhenInUseAuthorization];
        // [self.locationManager requestAlwaysAuthorization];
    }
#endif
    
    self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.distanceFilter = kCLDistanceFilterNone;
    self.locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters; // 100 m
    self.locationManager.delegate = self;
    [self.locationManager startUpdatingLocation];
    
    
}

- (void)locationManager:(CLLocationManager *)locationManager didUpdateLocations:(NSArray *)locations
{
    
}

-(void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{

    ATMsModel *atms = [self.atmsLocations objectAtIndex:indexPath.row];
    
    
    NSString *text = [NSString stringWithFormat:@"%@ %@, %@ %@ ",atms.address.street,atms.address.building,atms.address.city,atms.address.place ];;

    
    if(indexPath.row == 2 || indexPath.row == 6)
    {
        text = @"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam";
    }
    
    if(indexPath.row == 4)
    {
        text = @"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.";
    }
    
    CGRect size = [text boundingRectWithSize:CGSizeMake(192,1000 ) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:16.0f]} context:nil];

    
    CGFloat f = 54.0f + ceilf(size.size.height) + 1.0f;
    return f;
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"idAtmsCell";
    
    ATMLocationsCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    ATMsModel *atms = [self.atmsLocations objectAtIndex:indexPath.row];
    cell.name.text = atms.address.street;
    cell.address.text =[NSString stringWithFormat:@"%@ %@, %@ %@ ",atms.address.street,atms.address.building,atms.address.city,atms.address.place ];
    if([atms.type isEqualToString:@"Branch"])
        cell.image.image = [UIImage imageNamed:@"bankLogo"];
    else
        cell.image.image = [UIImage imageNamed:@"atmIcon"];
    
    
    if(indexPath.row == 2 || indexPath.row == 6)
    {
        cell.address.text = @"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam";
        
    }
    
    if(indexPath.row == 4)
    {
         cell.address.text = @"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.";
    }
    
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.atmsLocations count];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(void)setLocationDataWithArray:(NSArray *)array
{
    self.atmsLocations = array;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    ATMsLocationDetailController *pc = segue.destinationViewController;
    
    NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
    
    
    pc.atmModel = [self.atmsLocations objectAtIndex:indexPath.row];
    
    pc.userLocation = self.locationManager.location.coordinate;
    
    
}

@end
