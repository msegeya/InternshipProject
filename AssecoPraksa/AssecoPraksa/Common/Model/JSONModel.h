//
//  JSONModel.h
//  AssecoPraksa
//
//  Created by MTLab on 08/04/15.
//  Copyright (c) 2015 asseco. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JSONModel : NSObject <NSCopying,NSMutableCopying>

-(id) initWithDictionary:(NSMutableDictionary*) jsonDictionary;

@end
