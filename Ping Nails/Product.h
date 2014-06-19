//
//  Product.h
//  Ping Nails
//
//  Created by Taya technologies on 31/05/14.
//  Copyright (c) 2014 Taya technologies. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Product : NSObject
@property (nonatomic ) int productid;
@property (nonatomic , strong ) NSString *name;
@property (nonatomic , strong ) NSString *description;
@property (nonatomic  ) double price;
@property (nonatomic , strong ) NSString *imageName;
//@property (nonatomic , strong ) NSString *selectedImageName;
@property (nonatomic ) int catagoryid;
@property (nonatomic ) int quantity;
@end
