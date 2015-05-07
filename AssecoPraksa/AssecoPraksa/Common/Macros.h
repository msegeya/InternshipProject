//
//  Macros.h
//  AssecoPraksa
//
//  Created by MTLab on 13/04/15.
//  Copyright (c) 2015 asseco. All rights reserved.
//

#ifdef DEBUG
#   define DLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
#   define ILog(fmt, ...) NSLog((fmt), ##__VA_ARGS__);
#else
#   define DLog(...)
#   define ILog(...)
#endif

