//
//  leftTableCell2.m
//  Ping Nails
//
//  Created by Taya technologies on 15/05/14.
//  Copyright (c) 2014 Taya technologies. All rights reserved.
//

#import "leftTableCell2.h"

@implementation leftTableCell2
@synthesize  Quantity2,Barcode,NameOfTheservice2;
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
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
