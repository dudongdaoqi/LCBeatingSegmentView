//
//  LCBeatingSegmentView.m
//  
//
//  Created by lc on 12-1-29.
//  Copyright (c) 2012年 LC. All rights reserved.
//

#import <QuartzCore/QuartzCore.h> 
#import "LCBeatingSegmentView.h"


@interface LCBeatingSegmentView()

@property (nonatomic, retain) NSMutableArray *m_pUIArray;
@property (nonatomic, assign) UIButton *m_pLastBtn;

@end

@implementation LCBeatingSegmentView

@synthesize m_pUIArray = _m_pUIArray;
@synthesize m_pLastBtn = _m_pLastBtn;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
       // self.backgroundColor = [UIColor grayColor];
        _m_pUIArray = [[NSMutableArray alloc]init];
        self.layer.borderColor = [UIColor blackColor].CGColor;
        self.layer.borderWidth = 1.0;
    }
    return self;
}


- (void)setupUI:(NSMutableArray *)data
{
    if (data.count > 0)
    {
        for (int i = 0; i < data.count; i++)
        {
            UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
            [btn setTitle:[data objectAtIndex:i] forState:UIControlStateNormal];
            [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            [btn addTarget:self action:@selector(btnDown:) forControlEvents:UIControlEventTouchUpInside];
            [self.m_pUIArray addObject:btn];
        }
        [self setupFrame];
    }
}

- (void)setupFrame
{
    CGRect rect = self.frame;
    float height = rect.size.height/2;
    float width = 0;
    for (int i = 0; i < self.m_pUIArray.count; i++)
    {
        UIButton *btn = [self.m_pUIArray objectAtIndex:i];
        btn.frame = CGRectMake(i*60, height-25, 60, 50);
        [self addSubview:btn];
        width += 60;
    }
    self.contentSize = CGSizeMake((self.frame.size.width+1)>width?(self.frame.size.width+1):width, self.frame.size.height);
}


- (void)btnDown:(UIButton*)sender
{
    if (_m_pLastBtn)
    {
        [_m_pLastBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    }
    [sender.layer addAnimation:[self moveUp:sender Y:10 R:2 T:0.1] forKey:@"translation"];
    [sender setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    _m_pLastBtn = sender;
}

- (CABasicAnimation *)moveUp:(UIView *)target Y:(CGFloat)upHeight R:(NSInteger)num T:(CGFloat)time
{
    CGFloat x = CGRectGetMidX(target.frame);
    CGFloat y = CGRectGetMinY(target.frame);
    CGFloat height = CGRectGetHeight(target.frame);
    
    CABasicAnimation*translation = [CABasicAnimation animationWithKeyPath:@"position"];
    
    translation.fromValue= [NSValue valueWithCGPoint:CGPointMake(x , y + height *0.5)];
    translation.toValue= [NSValue valueWithCGPoint:CGPointMake( x, y + height *0.5 - upHeight)];
    translation.timingFunction= [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    translation.duration= time;
    translation.repeatCount= num;
    translation.autoreverses= YES;
    translation.fillMode = kCAFillModeRemoved;
    
    return translation;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
