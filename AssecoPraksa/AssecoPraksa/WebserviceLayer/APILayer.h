//
//  APILayer.h
//  AssecoPraksa
//
//  Created by MTLab on 08/04/15.
//  Copyright (c) 2015 asseco. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "ResponseData.h"
#import <CoreLocation/CoreLocation.h>


@protocol APIResponsDelegate
@optional
-(void)responseLoginRecivedWithData:(ResponseData*)data;
-(void)responseTrnasactionsRecivedWithArray:(NSArray*)array;
-(void)responseATMsRecivedWithArray:(NSArray*)array;
-(void)responseExchangeRateRecivedWithData:(NSArray*)array;
-(void)responseGoogleDistanceWithData:(NSString*)data;
@end

@interface APILayer : NSObject

-(void) loginRequestWithEmail:(NSString*) email andPaswword:(NSString*) password;
-(void) transactionRequestWithToken:(NSString*)token;
-(void) atmRequestWithToken:(NSString*)token;
-(void) exchangeRateRequestWithToken:(NSString*)token;

-(instancetype)initWithView:(UIView*)mainView;

-(void)requestGoogleDistanceWithOrigni:(CLLocationCoordinate2D)orignin andDestination:(CLLocationCoordinate2D)destination;
@property (strong,nonatomic) id<APIResponsDelegate> delegate;

@end
