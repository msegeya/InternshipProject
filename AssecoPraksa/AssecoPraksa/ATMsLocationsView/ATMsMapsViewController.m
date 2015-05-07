//
//  ATMsMapsViewController.m
//  AssecoPraksa
//
//  Created by MTLab on 13/04/15.
//  Copyright (c) 2015 asseco. All rights reserved.
//

#import "ATMsMapsViewController.h"
#import <GoogleMaps/GoogleMaps.h>
#import "ATMsModel.h"
#import "ATMsLocationTableController.h"
#import "ATMsLocationDetailController.h"


@interface ATMsMapsViewController()
{
    GMSMapView *mapView_;
    UserData *user;
}

@property (nonatomic,retain) CLLocationManager *locationManager;
@property (nonatomic,strong) APILayer *api;

@property (strong,nonatomic) NSArray *atmsLocations; //protocol property

@property (nonatomic,retain) IBOutlet  UISegmentedControl *segmentController;
-(IBAction)action:(id)sender;


@end


@implementation ATMsMapsViewController

//@synthesize atmsLocations;

#pragma mark - UiViewController
-(void)viewDidLoad{
    [super viewDidLoad];
    
    self.api = [[APILayer alloc]initWithView:self.view];
    self.api.delegate = self;
    
    user = [UserData sharedManager];
    
    [self.api  atmRequestWithToken:user.userToken];
    
    self.navigationItem.backBarButtonItem.title = @" ";
    
    
    
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

-(void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    
    [self.locationManager stopUpdatingLocation];
    
}
-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self.locationManager startUpdatingLocation];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    ATMsLocationTableController *destination = [segue destinationViewController];
    
    destination.atmsLocations = self.atmsLocations;
    
}

#pragma mark - Request 

-(void)responseATMsRecivedWithArray:(NSArray *)array
{
    
    self.atmsLocations = array;
    
    GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:46.3057
                                                            longitude:16.3400
                                                                 zoom:8];
    mapView_ = [GMSMapView mapWithFrame:self.view.bounds camera:camera];
    mapView_.myLocationEnabled = YES;
    
    
    mapView_.delegate = self;
    [self.view insertSubview:mapView_ atIndex:0] ;

    
    if(self.atmsLocations!=nil)
    {
        for(ATMsModel *atm in self.atmsLocations)
        {
            CLLocation *location =  atm.address.atmLocation.atmsLocation;
            GMSMarker *marker = [[GMSMarker alloc] init];
            marker.position = CLLocationCoordinate2DMake(location.coordinate.latitude, location.coordinate.longitude);
            marker.appearAnimation = kGMSMarkerAnimationPop;
            marker.title = atm.address.city;
            marker.snippet =[NSString stringWithFormat:@"%@, %@", atm.address.street,atm.address.place];
            marker.map = mapView_;
            marker.userData = atm ;
            
        }
        
    }
}

-(void)mapView:(GMSMapView *)mapView didTapInfoWindowOfMarker:(GMSMarker *)marker
{
    
    
    
    ATMsLocationDetailController *viewController =[[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"atmDetailId"];
    viewController.atmModel = marker.userData;
    viewController.userLocation = self.locationManager.location.coordinate;
    [self.navigationController pushViewController:viewController animated:YES];
    
}

- (void)action:(id)sender{
    
    UISegmentedControl *s = sender;
    
    switch (s.selectedSegmentIndex) {
        case 0:
            mapView_.mapType = kGMSTypeNormal;
            break;
        case 1:
            mapView_.mapType = kGMSTypeSatellite;
            break;
        case 2:
            mapView_.mapType = kGMSTypeHybrid;
            break;
        default:
            mapView_.mapType = mapView_.mapType;
            break;
    }  
    
}


- (void)locationManager:(CLLocationManager *)locationManager didUpdateLocations:(NSArray *)locations
{
    GMSMarker *marker = [[GMSMarker alloc] init];
    //DLog(@"%f, %f",self.locationManager.location.coordinate.latitude, self.locationManager.location.coordinate.longitude);
    
    marker.icon = [GMSMarker markerImageWithColor:[UIColor blueColor]];
    marker.map = mapView_;
}



@end
