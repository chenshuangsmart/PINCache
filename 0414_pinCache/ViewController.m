//
//  ViewController.m
//  0414_pinCache
//
//  Created by cs on 2018/4/14.
//  Copyright © 2018年 cs. All rights reserved.
//

#import "ViewController.h"
#import "PINCache.h"
#import "PINDiskCache.h"
#import "PINMemoryCache.h"

static NSString *key = @"key";

@interface ViewController ()

/** 硬盘缓存 */
@property(nonatomic, strong)PINDiskCache *diskCache;
/** 内存缓存 */
@property(nonatomic, strong)PINMemoryCache *memoryCache;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.diskCache = [[PINDiskCache alloc] initWithName:@"fileStore"];
    
    UIButton *saveBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 150, 35)];
    [saveBtn setTitle:@"存储" forState: UIControlStateNormal];
    [saveBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    saveBtn.center = CGPointMake(self.view.bounds.size.width * 0.5, self.view.bounds.size.height * 0.35);
    [saveBtn addTarget:self action:@selector(saveBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:saveBtn];
    
    UIButton *getBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 150, 35)];
    [getBtn setTitle:@"取值" forState: UIControlStateNormal];
    [getBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    getBtn.center = CGPointMake(self.view.bounds.size.width * 0.5, self.view.bounds.size.height * 0.65);
    [getBtn addTarget:self action:@selector(getBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:getBtn];
}

- (void)saveBtnClick {
    NSDictionary *params = @{@"key":@"value"};
    [self setData:params key:key];
    NSLog(@"存储值成");
}

- (void)getBtnClick {
    NSDictionary *params = [self getData:key];
    NSLog(@"params = %@",params);
}

- (id)getData:(NSString *)key {
    return [self.diskCache objectForKey:key];
}

- (void)setData:(NSDictionary*)data key:(NSString *)key {
    [self.diskCache setObject:data forKey:key];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
