//
//  APILayer.m
//  AssecoPraksa
//
//  Created by MTLab on 08/04/15.
//  Copyright (c) 2015 asseco. All rights reserved.
//

#import "APILayer.h"
#import "Transaction.h"
#import "ExchangeRateModel.h"
#import "ATMsModel.h"
#import "ActivityIndicatorController.h"


typedef NS_ENUM(NSUInteger, APIMethod) {
    APIMethodLogin,
    APIMethodTransaction,
    APIMethodATM,
    APIMethodExchange,
    APIMethodGoogle
};

NSString *const API_URL = @"http://188.226.211.157/api/v1/api.php?method=%@";
NSString *const METHOD_SINGIN = @"signIn&email=%@&password=%@";
NSString *const METHOD_TRANSACTION = @"getTransactions&token=%@";
NSString *const METHOD_ATMS = @"getATMs&token=%@";
NSString *const METHOD_EXCHANGE_RATE = @"getCurrencyExchangeRate&token=%@";

@interface APILayer ()
{
    ActivityIndicatorController *activityIndicator;
}
@end
@implementation APILayer

#pragma mark - Login


-(instancetype)initWithView:(UIView*)mainView
{
    self = [super init];
    activityIndicator = [[ActivityIndicatorController alloc]initWithNibName:@"ActivityIndicatorView" withMainView:mainView];
    
    return self;
}
-(void)loginRequestWithEmail:(NSString *)email andPaswword:(NSString *)password
{
    [self sendRequestWithUrl:[NSString stringWithFormat:API_URL,
                               [NSString stringWithFormat:METHOD_SINGIN,email,password]] andMethod:APIMethodLogin];
    
}

-(void)sendRequestWithUrl:(NSString *)stringUrl andMethod:(APIMethod)method
{
    [activityIndicator startActivityIndicatorWithNetwork:YES];
    
    NSURL *url = [NSURL URLWithString:stringUrl];
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
    
    
    
    [NSURLConnection sendAsynchronousRequest:request
                                       queue:[NSOperationQueue mainQueue]
                           completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError)
     {
         
         NSHTTPURLResponse *urlResponse = (NSHTTPURLResponse *)response;
         //DLog(@"Response Body: %@", [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]);
         
         if (!connectionError) {
             
             NSError *error = nil;
             NSMutableDictionary *jsonArray = [NSJSONSerialization JSONObjectWithData:data
                                                                              options:kNilOptions
                                                                                error:&error];
             
             if (error != nil) {
                 DLog(@"Error parsing JSON.");
                 [AlertHelper showAlertWithMessage:NSLocalizedString(@"JSON_Error_msg", @"Error in JSON...")];
                 
             }
             else
             {
                 
                 BOOL status = [jsonArray[@"status"] boolValue];
                 NSString *statusOk =  method == APIMethodGoogle ? jsonArray[@"status"] : @"" ;
                 
                 if(status || [statusOk isEqualToString:@"OK"])
                 {
                     
                     switch (method)
                     {
                         case APIMethodLogin:
                         {
                             ResponseData *responseData = [[ResponseData alloc] initWithDictionary:jsonArray];
                             
                             [self.delegate responseLoginRecivedWithData:responseData];
                             
                             break;
                         }
                         case APIMethodTransaction:
                         {
                             NSMutableArray *transItems = [NSMutableArray array];
                             
                             NSMutableArray *transItemsJson = jsonArray[@"result"][@"items"];
                             
                             [transItemsJson enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL
                                                                          *stop) {
                                 [transItems addObject:[[Transaction alloc] initWithDictionary:obj]];
                             }];
                             
                             [self.delegate responseTrnasactionsRecivedWithArray:transItems];
                             break;
                         }
                         case APIMethodATM:
                         {
                             NSMutableArray *atmItems = [NSMutableArray array];
                             NSMutableArray *atmItemsJson = jsonArray[@"result"][@"Branch42items"];
                           //  DLog(@"ATM: %@",atmItemsJson);
                             
                             [atmItemsJson enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL
                                                                        *stop) {
                                 [atmItems addObject:[[ATMsModel alloc] initWithDictionary:obj]];
                             }];
                             
                             [self.delegate responseATMsRecivedWithArray:atmItems];
                             break;
                         }
                             
                         case APIMethodExchange:
                         {
                             
                             NSMutableArray *exchangeItemsJson = jsonArray[@"result"][@"items"];
                             NSMutableArray *exchangeRateItems = [NSMutableArray array];
                             
                            // DLog(@"EXCHANGE: %@",exchangeItemsJson);
                             
                             [exchangeItemsJson enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL
                                                                        *stop) {
                                 [exchangeRateItems addObject:[[ExchangeRateModel alloc]initWithDictionary:obj]];
                             }];
                             
                             
                             [self.delegate responseExchangeRateRecivedWithData:exchangeRateItems];
                             break;
                         }
                             case APIMethodGoogle:
                         {
                             
                             NSMutableArray *rows = jsonArray[@"rows"][0][@"elements"];
                             
                             NSInteger distance=0;
                             
                             for(NSDictionary *row in rows)
                             {
                                 for(NSString *key in row.allKeys)
                                 {
                                     if([key isEqualToString:@"distance"])
                                     {
                                         distance += [[[row valueForKey:key] valueForKey:@"value"] integerValue];
                                     }
                                     
                                 }
                             }
                             
                             
                             
                             

                             
                            DLog(@"VALUE: %ld",distance);
                             
                             
                            [self.delegate responseGoogleDistanceWithData:[NSString stringWithFormat:@"%ld",(long)distance]];
                             
                             
                             break;
                         }
                     }
                     
                 }else
                 {
                     [AlertHelper showAlertWithMessage:jsonArray[@"message"]];
                     DLog(@"%@",jsonArray);
                 }
                 
             }
             
         }
         else {
             DLog(@"EROR");
             
             [AlertHelper showAlertWithMessage:[NSString stringWithFormat: @"Response Code: %li %@",
                                                (long)urlResponse.statusCode,
                                                [NSHTTPURLResponse localizedStringForStatusCode:urlResponse.statusCode]]];
             
         }
         [activityIndicator stopActivityIndicator];
     }];
    
    
}

#pragma mark - Transaction

-(void)transactionRequestWithToken:(NSString *)token
{
    [self sendRequestWithUrl:[NSString stringWithFormat:API_URL,
                               [NSString stringWithFormat:METHOD_TRANSACTION, token]] andMethod:APIMethodTransaction];
}

#pragma mark - ATMs

-(void)atmRequestWithToken:(NSString *)token
{
    
    
    [self sendRequestWithUrl:[NSString stringWithFormat:API_URL,
                               [NSString stringWithFormat:METHOD_ATMS, token]] andMethod:APIMethodATM];
    
    
}

#pragma mark - Exchange rates

-(void)exchangeRateRequestWithToken:(NSString *)token
{
    
    [self sendRequestWithUrl:[NSString stringWithFormat:API_URL,
                               [NSString stringWithFormat:METHOD_EXCHANGE_RATE, token]] andMethod:APIMethodExchange];
    
}


-(void)requestGoogleDistanceWithOrigni:(CLLocationCoordinate2D)orignin andDestination:(CLLocationCoordinate2D)destination
{
    NSString *goolgeApiUrl = [Helper getValueFromPlistForKey:kConfigGoogleDirectionsAPIURL];

    
    NSString *origninString = [NSString stringWithFormat:@"%f,%f",orignin.latitude,orignin.longitude];
    NSString *destinationString = [NSString stringWithFormat:@"%f,%f",destination.latitude,destination.longitude];
    
    NSString *stringUrl = [NSString stringWithFormat:goolgeApiUrl,origninString,destinationString];
    
    DLog(@"%@",stringUrl);
    
    [self sendRequestWithUrl:stringUrl andMethod:APIMethodGoogle];
}


@end
