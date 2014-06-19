//
//  Employee.h
//  Ping Nails
//
//  Created by Taya technologies on 31/05/14.
//  Copyright (c) 2014 Taya technologies. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Employee : NSObject
@property ( nonatomic ) int employeeid;
@property ( nonatomic , strong ) NSString *name;
@property ( nonatomic , strong ) NSString *description;
@property ( nonatomic , strong ) NSString *imageName;
@end
