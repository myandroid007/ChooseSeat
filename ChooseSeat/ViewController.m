//
//  ViewController.m
//  ChooseSeat
//
//  Created by ly on 16/6/30.
//  Copyright © 2016年 ly. All rights reserved.
//

#import "ViewController.h"
#import "HouseCell.h"
#define SCREENWIDTH [UIScreen mainScreen].bounds.size.width
#define SCREENHEIGHT [UIScreen mainScreen].bounds.size.height


@interface ViewController ()
@property (nonatomic, strong) NSArray *dataArray1;
@property (nonatomic, strong) NSArray *dataArray2;
@property (nonatomic, strong) NSArray *dataArray3;
@property (nonatomic, strong) NSArray *dataArray4;
@property (nonatomic, strong) NSArray *dataArray5;
@property (nonatomic, strong) NSArray *dataArray6;

@property (nonatomic, strong) NSArray *totalArray;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.dataArray1 = @[@"101",@"102",@"103",@"104",@"105",@"106"];
    self.dataArray2 = @[@"201",@"202",@"203",@"204",@"205",@"206"];
    self.dataArray3 = @[@"301",@"302",@"303",@"304",@"305",@"306"];
    self.dataArray4 = @[@"401",@"402",@"403",@"404",@"405",@"406",@"407",@"408",@"409",@"410",@"411",@"412",@"413"];
    self.dataArray5 = @[@"501",@"502",@"503",@"504",@"505",@"506"];
    self.dataArray6 = @[@"601",@"602",@"603",@"604",@"605",@"606"];
    self.totalArray = @[self.dataArray6,self.dataArray5,self.dataArray4,self.dataArray3,self.dataArray2,self.dataArray1];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"HouseCell" bundle:nil] forCellReuseIdentifier:@"HouseCell"];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDelegate,UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.totalArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellID = @"HouseCell";
    HouseCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    
    NSArray *array = self.totalArray[indexPath.row];
    cell.dataArray = array;
    
    cell.floorLbl.text = [NSString stringWithFormat:@"%ldF",self.totalArray.count - (long)indexPath.row];
    
    cell.houseDetailBlock = ^(NSInteger index){
        
        NSLog(@"%@",array[index]);
    };
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSArray *array = self.totalArray[indexPath.row];
    NSInteger count = array.count;
    
    if (SCREENWIDTH == 320){
        if (count % 3 == 0){
            return (count / 3) * 50;
        }else{
            return (count / 3) * 50 + 50;
        }
    }else{
        if (count % 4 == 0){
            return (count / 4) * 50;
        }else{
            return (count / 4) * 50 + 50;
        }
    }
}


@end
