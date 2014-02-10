//
//  ViewController.m
//  
//
//  Created by lc on 12-1-29.
//  Copyright (c) 2012年 LC. All rights reserved.
//

#import "AnimationViewController.h"
#import "LCBeatingSegmentView.h"

@interface AnimationViewController ()

@property (nonatomic, retain) LCBeatingSegmentView *m_pScrollSegment;

@end

@implementation AnimationViewController

@synthesize m_pScrollSegment = _m_pScrollSegment;
@synthesize imageView;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    NSMutableArray *arr = [[NSMutableArray alloc]initWithCapacity:10];
    for (int i = 0; i < 10; i++) {
        [arr addObject:[NSString stringWithFormat:@"%i",i]];
    }
    
    _m_pScrollSegment = [[LCBeatingSegmentView alloc]initWithFrame:CGRectMake(0,200, CGRectGetWidth(self.view.frame),60)];
    [_m_pScrollSegment setupUI:arr];
    [self.view addSubview:_m_pScrollSegment];
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
