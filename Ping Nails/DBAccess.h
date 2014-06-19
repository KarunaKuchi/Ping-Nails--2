//
//  DBAccess.h
//  Ping Nails
//
//  Created by Taya technologies on 31/05/14.
//  Copyright (c) 2014 Taya technologies. All rights reserved.
//

#import <Foundation/Foundation.h>
//#import <sqlite3.h>
#import "Product.h"
#import "Employee.h"
#import "Categorys.h"
#import "sqlite3.h"
@interface DBAccess : NSObject
{
    sqlite3 *database;
    NSMutableArray *empDetailsArray,*categoriesArray,*productsbyCategoryArray;
}
+(DBAccess *)database;
-(NSMutableArray *)getAllEmpDetails;//instant method
-(NSMutableArray *)getAllCategories;
-(NSMutableArray *)getAllProductsbyCategory:(int)categoryid;
@end
