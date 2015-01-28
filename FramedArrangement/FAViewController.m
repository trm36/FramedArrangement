//
//  FAViewController.m
//  FramedArrangement
//
//  Created by Taylor Mott on 28.1.2015.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "FAViewController.h"

@interface FAViewController ()

@property (strong, nonatomic) UIView *redView;
@property (strong, nonatomic) UIView *greenView;
@property (strong, nonatomic) UIView *blueView;
@property (strong, nonatomic) UIView *yellowView;

@end

@implementation FAViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.redView = [UIView new];
    self.redView.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.redView];
    
    self.greenView = [UIView new];
    self.greenView.backgroundColor = [UIColor greenColor];
    [self.view addSubview:self.greenView];
    
    self.blueView = [[UIView alloc] init];
    self.blueView.backgroundColor = [UIColor blueColor];
    [self.view addSubview:self.blueView];
    
    self.yellowView = [UIView new];
    self.yellowView.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:self.yellowView];
    
    [self startCycleViews];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)layoutSquares
{
    CGFloat superViewWidth = self.view.frame.size.width;

    self.redView.frame = CGRectMake(0, 0, superViewWidth / 2, superViewWidth / 2);
    self.greenView.frame = CGRectMake(superViewWidth / 2, 0, superViewWidth / 2, superViewWidth / 2);
    self.blueView.frame = CGRectMake(0, superViewWidth / 2, superViewWidth / 2, superViewWidth / 2);
    self.yellowView.frame = CGRectMake(superViewWidth / 2, superViewWidth / 2, superViewWidth / 2, superViewWidth / 2);
    [self performSelector:@selector(layoutHorizontalRectangles) withObject:self afterDelay:1.0];
}

- (void)layoutHorizontalRectangles
{
    CGFloat superViewWidth = self.view.frame.size.width;
    CGFloat superViewHeight = self.view.frame.size.height;
    
    self.redView.frame = CGRectMake(0, 0, superViewWidth, superViewHeight / 4);
    self.greenView.frame = CGRectMake(0, superViewHeight / 4, superViewWidth, superViewHeight / 4);
    self.blueView.frame = CGRectMake(0, superViewHeight / 4 * 2, superViewWidth, superViewHeight / 4);
    self.yellowView.frame = CGRectMake(0, superViewHeight / 4 * 3, superViewWidth, superViewHeight / 4);
    [self performSelector:@selector(layoutVerticalRectangles) withObject:self afterDelay:1.0];
    
}

- (void)layoutVerticalRectangles
{
    CGFloat superViewWidth = self.view.frame.size.width;
    CGFloat superViewHeight = self.view.frame.size.height;
    
    self.redView.frame = CGRectMake(0, 0, superViewWidth / 4, superViewHeight);
    self.greenView.frame = CGRectMake(superViewWidth / 4, 0, superViewWidth / 4, superViewHeight);
    self.blueView.frame = CGRectMake(superViewWidth / 4 * 2, 0, superViewWidth / 4, superViewHeight);
    self.yellowView.frame = CGRectMake(superViewWidth / 4 * 3, 0, superViewWidth / 4, superViewHeight);
    [self performSelector:@selector(layoutDiagonalSquares) withObject:self afterDelay:1.0];
}

- (void)layoutDiagonalSquares
{
    CGFloat superViewWidth = self.view.frame.size.width;
    CGFloat squareDimension = superViewWidth / 4;
    
    self.redView.frame = CGRectMake(0, 0, squareDimension, squareDimension);
    self.greenView.frame = CGRectMake(squareDimension, squareDimension, squareDimension, squareDimension);
    self.blueView.frame = CGRectMake(squareDimension * 2, squareDimension * 2, squareDimension, squareDimension);
    self.yellowView.frame = CGRectMake(squareDimension * 3, squareDimension * 3, squareDimension, squareDimension);
    [self performSelector:@selector(layoutSquares) withObject:self afterDelay:1.0];
}

- (void)startCycleViews
{
    [self layoutSquares];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
