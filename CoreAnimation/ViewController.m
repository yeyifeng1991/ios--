//
//  ViewController.m
//  CoreAnimation
//
//  Created by 叶子 on 2017/12/1.
//  Copyright © 2017年 叶义峰. All rights reserved.
//

#import "ViewController.h"
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
@interface ViewController ()<CAAnimationDelegate>
@property(nonatomic,strong)UIView *demoView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    CGFloat myViewW = 100;
    CGFloat myViewH = 100;
    CGFloat myViewX = (SCREEN_WIDTH - myViewW)/2;
    CGFloat myViewY = (SCREEN_HEIGHT - myViewH)/3;
    self.demoView = [[UIView alloc]initWithFrame:CGRectMake(myViewX, myViewY, myViewW, myViewH)];
    [self.view addSubview:self.demoView];
    self.demoView.backgroundColor = [UIColor redColor];
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    
#pragma mark - 使用CABasicAnimation创建基础动画
   
    
    
    
     //使用CABasicAnimation创建基础动画
     CABasicAnimation *anima = [CABasicAnimation animationWithKeyPath:@"position"];
     anima.fromValue = [NSValue valueWithCGPoint:CGPointMake(0, SCREEN_HEIGHT/2-75)];
     anima.toValue = [NSValue valueWithCGPoint:CGPointMake(SCREEN_WIDTH, SCREEN_HEIGHT/2-75)];
     anima.duration = 1.0f;
//     anima.fillMode = kCAFillModeForwards; 当动画结束后，layer会一直保持着动画最后的状态
//     anima.removedOnCompletion = NO;
     [self.demoView.layer addAnimation:anima forKey:@"positionAnimation"];
     
    
#pragma mark - UIView 代码块调用：
    
    /*
     // UIView 代码块调用：
     _demoView.frame = CGRectMake(0, SCREEN_HEIGHT/2-50, 50, 50);
     
     [UIView animateWithDuration:1.0f animations:^{
     _demoView.frame = CGRectMake(SCREEN_WIDTH, SCREEN_HEIGHT/2-50, 50, 50);
     } completion:^(BOOL finished) {
     _demoView.frame = CGRectMake(SCREEN_WIDTH/2-25, SCREEN_HEIGHT/2-50, 50, 50);
     }];
     */
    
    
 #pragma mark - UIView [begin commit]模式
    /*
     _demoView.frame = CGRectMake(0, SCREEN_HEIGHT/2-50, 50, 50);
     [UIView beginAnimations:nil context:nil];
     [UIView setAnimationDuration:1.0f];
     _demoView.frame = CGRectMake(SCREEN_WIDTH, SCREEN_HEIGHT/2-50, 50, 50);
     [UIView commitAnimations];
     */
    
    
  #pragma mark - 透明动画
    
    /*
     
     CABasicAnimation *anima = [CABasicAnimation animationWithKeyPath:@"opacity"];
     anima.fromValue = [NSNumber numberWithFloat:1.0f];
     anima.toValue = [NSNumber numberWithFloat:0.2f];
     anima.duration = 1.0f;
     [_demoView.layer addAnimation:anima forKey:@"opacityAniamtion"];
     
     */

    
#pragma mark - 缩放动画
    /*
     CABasicAnimation *anima = [CABasicAnimation animationWithKeyPath:@"transform.scale"];//同上
     anima.toValue = [NSNumber numberWithFloat:2.0f];
     anima.duration = 1.0f;
     [_demoView.layer addAnimation:anima forKey:@"scaleAnimation"];
     */
    
#pragma mark - 旋转动画
    /*
     CABasicAnimation *anima = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];//绕着z轴为矢量，进行旋转(@"transform.rotation.z"==@@"transform.rotation")
     anima.toValue = [NSNumber numberWithFloat:3*M_PI];
     anima.duration = 1.0f;
     [_demoView.layer addAnimation:anima forKey:@"rotateAnimation"];
     */
    

#pragma mark - 背景色变化动画
    /*
     CABasicAnimation *anima = [CABasicAnimation animationWithKeyPath:@"backgroundColor"];
     anima.toValue =(id) [UIColor greenColor].CGColor;
     anima.duration = 5.0f;
     [_demoView.layer addAnimation:anima forKey:@"backgroundAnimation"];
     */
  

#pragma mark - 关键帧动画 values
    /*
     CAKeyframeAnimation *anima = [CAKeyframeAnimation animationWithKeyPath:@"position"];
     NSValue *value0 = [NSValue valueWithCGPoint:CGPointMake(0, SCREEN_HEIGHT/2-50)];
     NSValue *value1 = [NSValue valueWithCGPoint:CGPointMake(SCREEN_WIDTH/3, SCREEN_HEIGHT/2-50)];
     NSValue *value2 = [NSValue valueWithCGPoint:CGPointMake(SCREEN_WIDTH/3, SCREEN_HEIGHT/2+50)];
     NSValue *value3 = [NSValue valueWithCGPoint:CGPointMake(SCREEN_WIDTH*2/3, SCREEN_HEIGHT/2+50)];
     NSValue *value4 = [NSValue valueWithCGPoint:CGPointMake(SCREEN_WIDTH*2/3, SCREEN_HEIGHT/2-50)];
     NSValue *value5 = [NSValue valueWithCGPoint:CGPointMake(SCREEN_WIDTH, SCREEN_HEIGHT/2-50)];
     anima.values = [NSArray arrayWithObjects:value0,value1,value2,value3,value4,value5, nil];
     anima.duration = 2.0f;
     anima.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];//设置动画的节奏
     anima.delegate = self;//设置代理，可以检测动画的开始和结束
     [_demoView.layer addAnimation:anima forKey:@"keyFrameAnimation"];
     */
    
    
  
#pragma mark - path动画
    /*
     CAKeyframeAnimation *anima = [CAKeyframeAnimation animationWithKeyPath:@"position"];
     UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(SCREEN_WIDTH/2-100, SCREEN_HEIGHT/2-100, 200, 200)];
     anima.path = path.CGPath;
     anima.duration = 2.0f;
     [_demoView.layer addAnimation:anima forKey:@"pathAnimation"];
     */

    
#pragma mark - CAAnimationGroup 组合动画
    /*
     // 位移动画
     CAKeyframeAnimation *anima1 = [CAKeyframeAnimation animationWithKeyPath:@"position"];
     NSValue *value0 = [NSValue valueWithCGPoint:CGPointMake(0, SCREEN_HEIGHT/2-50)];
     NSValue *value1 = [NSValue valueWithCGPoint:CGPointMake(SCREEN_WIDTH/3, SCREEN_HEIGHT/2-50)];
     NSValue *value2 = [NSValue valueWithCGPoint:CGPointMake(SCREEN_WIDTH/3, SCREEN_HEIGHT/2+50)];
     NSValue *value3 = [NSValue valueWithCGPoint:CGPointMake(SCREEN_WIDTH*2/3, SCREEN_HEIGHT/2+50)];
     NSValue *value4 = [NSValue valueWithCGPoint:CGPointMake(SCREEN_WIDTH*2/3, SCREEN_HEIGHT/2-50)];
     NSValue *value5 = [NSValue valueWithCGPoint:CGPointMake(SCREEN_WIDTH, SCREEN_HEIGHT/2-50)];
     anima1.values = [NSArray arrayWithObjects:value0,value1,value2,value3,value4,value5, nil];
     
     //缩放动画
     CABasicAnimation *anima2 = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
     anima2.fromValue = [NSNumber numberWithFloat:0.8f];
     anima2.toValue = [NSNumber numberWithFloat:2.0f];
     
     //旋转动画
     CABasicAnimation *anima3 = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
     anima3.toValue = [NSNumber numberWithFloat:M_PI*4];
     
     //组动画
     CAAnimationGroup *groupAnimation = [CAAnimationGroup animation];
     groupAnimation.animations = [NSArray arrayWithObjects:anima1,anima2,anima3, nil];
     groupAnimation.duration = 4.0f;
     
     [_demoView.layer addAnimation:groupAnimation forKey:@"groupAnimation"];
     */
    
    
#pragma mark - 过渡动画
    
    /*
     [UIView beginAnimations:@"animationID" context:nil];
     [UIView setAnimationDuration:0.5f]; //动画时长
     [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
     [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:self.demoView cache:YES]; //给视图添加过渡效果
     //在这里写你的代码.
     [UIView commitAnimations]; //提交动画
     */
    
    
  
}
- (void)animationDidStart:(CAAnimation *)anim;

{
    NSLog(@"动画执行");
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag;
{
    NSLog(@"动画结束");
    
}
#pragma CATransition动画实现
- (void) transitionWithType:(NSString *) type WithSubtype:(NSString *) subtype ForView : (UIView *) view
{
    //创建CATransition对象
    CATransition *animation = [CATransition animation];
    //设置运动时间
    animation.duration = 2;
    //设置运动type
    animation.type = type;
    if (subtype != nil) {
        //设置子类
        animation.subtype = subtype;
    }
    //设置运动速度
    animation.timingFunction = UIViewAnimationOptionCurveEaseInOut;
    [view.layer addAnimation:animation forKey:@"animation"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 暂停CALayer动画
- (void)pauseLayer:(CALayer*)layer
{
    CFTimeInterval pausedTime = [layer convertTime:CACurrentMediaTime() fromLayer:nil];
    // 让CALayer的时间停止走动
    layer.speed = 0.0;
    // 让CALayer的时间停留在pausedTime这个时刻
    layer.timeOffset = pausedTime;
}
#pragma mark - 恢复动画
- (void)resumeLayer:(CALayer*)layer
{
    CFTimeInterval pausedTime = layer.timeOffset;
    // 1. 让CALayer的时间继续行走
    layer.speed = 1.0;
    // 2. 取消上次记录的停留时刻
    layer.timeOffset = 0.0;
    // 3. 取消上次设置的时间
    layer.beginTime = 0.0;
    // 4. 计算暂停的时间(这里也可以用CACurrentMediaTime()-pausedTime)
    CFTimeInterval timeSincePause = [layer convertTime:CACurrentMediaTime() fromLayer:nil] - pausedTime;
    // 5. 设置相对于父坐标系的开始时间(往后退timeSincePause)
    layer.beginTime = timeSincePause;
    
}

- (IBAction)pause:(id)sender {
    
    [self pauseLayer:self.demoView.layer];
}
- (IBAction)resume:(id)sender {
    [self resumeLayer:self.demoView.layer];
}

@end
