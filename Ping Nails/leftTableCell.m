//
//  leftTableCell.m
//  Ping Nails
//
//  Created by Taya technologies on 12/05/14.
//  Copyright (c) 2014 Taya technologies. All rights reserved.
//

#import "leftTableCell.h"
#import "DBAccess.h"
@implementation leftTableCell
@synthesize Price,Quantity,NameofServices,empbtn;
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        // Initialization code

    }
    return self;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
@end
