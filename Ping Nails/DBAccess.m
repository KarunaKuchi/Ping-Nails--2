//
//  DBAccess.m
//  Ping Nails
//
//  Created by Taya technologies on 31/05/14.
//  Copyright (c) 2014 Taya technologies. All rights reserved.
//

#import "DBAccess.h"

@implementation DBAccess

static DBAccess *database;
+(DBAccess *)database
{
    if (database==nil) {
        database=[[DBAccess alloc]init];
    }
    return database;
}
-(id)init
{
    self=[super init];
    if (self)
    {//sqliteDB.sqlite3
        NSString *sqliteDb=[[NSBundle mainBundle]pathForResource:@"sqliteDB" ofType:@"sqlite"];
        if (sqlite3_open([sqliteDb UTF8String], &database)!=SQLITE_OK)
        {
            NSLog(@"failed to open database");
        }
    //   NSLog(@"path is %@",sqliteDb);
    }
    return self;
}

-(NSMutableArray *)getAllEmpDetails
{
    empDetailsArray=[[NSMutableArray alloc] init];
    NSString *query=@"SELECT *FROM employee";
    sqlite3_stmt *statement;
    if(sqlite3_prepare_v2(database, [query UTF8String], -1, &statement, nil)==SQLITE_OK)
    {
        while (sqlite3_step(statement)==SQLITE_ROW)
        {
            int empId=sqlite3_column_int(statement, 0);
            char *empNameChar=(char *) sqlite3_column_text(statement, 1);
            NSMutableString *empName=[[NSMutableString alloc] initWithUTF8String:empNameChar];
            Employee *emp = [[Employee alloc] init];
            emp.employeeid = empId;
            emp.name = empName;
            [empDetailsArray addObject:emp];
        }
        sqlite3_finalize(statement);
    }
    return empDetailsArray;
}
-(NSMutableArray *)getAllCategories
{
    categoriesArray=[[NSMutableArray alloc] init];
    NSString *query=@"SELECT *FROM category";
    sqlite3_stmt *statement;
    if(sqlite3_prepare_v2(database, [query UTF8String], -1, &statement, nil)==SQLITE_OK)
    {
        while (sqlite3_step(statement)==SQLITE_ROW)
        {
            int categoryid=sqlite3_column_int(statement, 0);
            char *catNameChar=(char *) sqlite3_column_text(statement, 1);
            char *desChar=(char *) sqlite3_column_text(statement, 2);
            NSMutableString *name=[[NSMutableString alloc] initWithUTF8String:catNameChar];
            NSMutableString *description=[[NSMutableString alloc] initWithUTF8String:desChar];
            Categorys *cat=[[Categorys alloc] init];
            cat.categoryid=categoryid;
            cat.name=name;
            cat.description=description;
            [categoriesArray addObject:cat];
        }
        sqlite3_finalize(statement);
    }
    return categoriesArray;
}
-(NSMutableArray *)getAllProductsbyCategory:(int)categoryid
{
    productsbyCategoryArray=[[NSMutableArray alloc] init];
    NSString *query=[NSString stringWithFormat:@"SELECT *FROM product where catagoryid = %d",categoryid];
    sqlite3_stmt *statement;
    if(sqlite3_prepare_v2(database, [query UTF8String], -1, &statement, nil)==SQLITE_OK)
    {
        while (sqlite3_step(statement)==SQLITE_ROW)
        {
            int productid=sqlite3_column_int(statement, 0);
            char *serviceNameCahr=(char *) sqlite3_column_text(statement, 1);
            char *serviceDescChar=(char *) sqlite3_column_text(statement, 2);
            double price=sqlite3_column_double(statement, 3);
            char *imageNameChar=(char *) sqlite3_column_text(statement, 4);
            int catagoryid=sqlite3_column_int(statement, 5);
          //  char *selectedImageNamechar=(char *) sqlite3_column_text(statement, 6);
            NSMutableString *name=[[NSMutableString alloc] initWithUTF8String:serviceNameCahr];
            NSMutableString *description=[[NSMutableString alloc]initWithUTF8String:serviceDescChar];
            NSMutableString *imageName=[[NSMutableString alloc]initWithUTF8String:imageNameChar];
           // NSMutableString *selectedImageName=[[NSMutableString alloc]initWithUTF8String:selectedImageNamechar];
            //VO or DTO implementation
            Product *productObj = [[Product alloc] init];
            productObj.productid= productid;
            productObj.name = name;
            productObj.description = description;
            productObj.price=price;
            productObj.imageName=imageName;
            productObj.catagoryid=catagoryid;
          //  productObj.selectedImageName=selectedImageName;
            [productsbyCategoryArray addObject:productObj];
        }
        sqlite3_finalize(statement);
    }
    return productsbyCategoryArray;
}

@end
