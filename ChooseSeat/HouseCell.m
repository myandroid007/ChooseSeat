//
//  HouseCell.m
//  ZTFB
//
//  Created by ly on 16/6/29.
//  Copyright © 2016年 ly. All rights reserved.
//

#import "HouseCell.h"
#import "HouseCollectionCell.h"
#define RGBCOLOR(r,g,b) \
[UIColor colorWithRed:r/255.f green:g/255.f blue:b/255.f alpha:1.f]

@interface HouseCell ()<UICollectionViewDelegate,UICollectionViewDataSource>

@property (weak, nonatomic) IBOutlet UICollectionView *collview;



@end



@implementation HouseCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    [self.collview registerNib:[UINib nibWithNibName:@"HouseCollectionCell" bundle:nil] forCellWithReuseIdentifier:@"HouseCollectionCell"];
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.itemSize = CGSizeMake(70, 40);
    
    layout.minimumLineSpacing = 10;
    layout.minimumInteritemSpacing = 3;
    layout.sectionInset = UIEdgeInsetsMake(5, 0, 5, 0);
    
    self.collview.collectionViewLayout = layout;
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

- (void)setDataArray:(NSArray *)dataArray{
    _dataArray = dataArray;
    
    [self.collview reloadData];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    if (self.dataArray.count > 0){
        return self.dataArray.count;
    }
    
    return 0;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    HouseCollectionCell *item = [collectionView dequeueReusableCellWithReuseIdentifier:@"HouseCollectionCell" forIndexPath:indexPath];
    NSString *str = self.dataArray[indexPath.row];
    
    item.roomLbl.text = str;
    
    if (indexPath.row % 3 == 0){
        item.backgroundColor = RGBCOLOR(255, 89, 99);
    }else{
        item.backgroundColor = [UIColor whiteColor];
    }
    
    return item;
}


- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    self.houseDetailBlock(indexPath.row);
}

@end
