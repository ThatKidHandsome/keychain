//
//  ViewController.m
//  DataStore
//
//  Created by 众力金融 on 2019/1/8.
//  Copyright © 2019年 众力金融. All rights reserved.
//

#import "ViewController.h"
#import "NXZDataStore.h"

@interface ViewController ()

@end

static NSString *key = @"key";

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}
- (IBAction)Add:(id)sender {

    NSString *passWordStr = @"1234564";
    [NXZDataStore Add:key data:[passWordStr dataUsingEncoding:NSUTF8StringEncoding]];
}

- (IBAction)query:(id)sender {
    NSData *data = [NXZDataStore query:key];
    NSLog(@"查询数据%@",[[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding]);
}
- (IBAction)delete:(id)sender {
    [NXZDataStore Delete:key];
}

@end
