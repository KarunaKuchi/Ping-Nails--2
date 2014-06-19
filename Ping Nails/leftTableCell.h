//
//  leftTableCell.h
//  Ping Nails
//
//  Created by Taya technologies on 12/05/14.
//  Copyright (c) 2014 Taya technologies. All rights reserved.

#import <UIKit/UIKit.h>
#import "DBAccess.h"
#import <QuartzCore/QuartzCore.h>
#import "SalesViewController.h"
@interface leftTableCell : UITableViewCell<UIActionSheetDelegate>
{
//   UITextField *Quantity;
//    UILabel *NameofServices;
//    UILabel *Prise;
//    UIButton *empbtn;
}
@property (strong, nonatomic) IBOutlet UILabel *NameofServices;
@property (strong, nonatomic) IBOutlet UITextField *Quantity;
@property (strong, nonatomic) IBOutlet UILabel *Price;
@property (strong, nonatomic) IBOutlet UIButton *empbtn;


@end
