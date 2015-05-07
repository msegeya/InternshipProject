//
//  UserData.m
//  AssecoPraksa
//
//  Created by MTLab on 09/04/15.
//  Copyright (c) 2015 asseco. All rights reserved.
//

#import "UserData.h"

@implementation UserData

-(void)setUserWithName:(NSString *)name withToken:(NSString *)token andUserAccount:(Account *)userAcc
{
    
    
    self.userAccount = userAcc;
    self.userToken = token;
    self.userNname = name;
    
}

+(UserData *)sharedManager{
    
    static UserData *sharedMyManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedMyManager = [[self alloc] init];
    });
    return sharedMyManager;
    
}



@end
