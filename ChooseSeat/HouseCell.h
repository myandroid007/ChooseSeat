//
//  HouseCell.h
//  ZTFB
//
//  Created by ly on 16/6/29.
//  Copyright © 2016年 ly. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^HouseDetailBlock)(NSInteger);

@interface HouseCell : UITableViewCell
@property (nonatomic, strong) NSArray *dataArray;
@property (weak, nonatomic) IBOutlet UILabel *floorLbl;

@property (nonatomic, copy) HouseDetailBlock houseDetailBlock;


@end
