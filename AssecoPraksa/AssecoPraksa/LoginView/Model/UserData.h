//
//  UserData.h
//  AssecoPraksa
//
//  Created by MTLab on 09/04/15.
//  Copyright (c) 2015 asseco. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Account.h"

@interface UserData : NSObject

@property (strong, nonatomic) NSString *userToken;
@property (strong,nonatomic)  NSString *userNname;
@property (strong,nonatomic) Account *userAccount;

-(void) setUserWithName:(NSString*)name withToken:(NSString*)token andUserAccount:(Account*)userAcc;

+(UserData*)sharedManager;

@end
