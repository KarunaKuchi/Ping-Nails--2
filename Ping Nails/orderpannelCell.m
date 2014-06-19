//
//  orderpannelCell.m
//  Ping Nails
//
//  Created by Taya technologies on 29/05/14.
//  Copyright (c) 2014 Taya technologies. All rights reserved.
//

#import "orderpannelCell.h"

@implementation orderpannelCell
@synthesize price,Qntity,servName;
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
