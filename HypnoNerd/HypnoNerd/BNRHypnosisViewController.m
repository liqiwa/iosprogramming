//
//  BNRHypnosisViewController.m
//  
//
//  Created by 王琳琳 on 16/5/17.
//
//

#import "BNRHypnosisViewController.h"
#import "BNRHypnosisView.h"
//@end为止后加入，才可以变化了颜色，将BNRHypnosisView 类变成属性
@interface BNRHypnosisViewController ()
@property (nonatomic,strong) BNRHypnosisView *uis;
@end
@implementation BNRHypnosisViewController

- (void)loadView
{
    ////将BNRHypnosisView属性后的对象赋值。
  //创建一个BNRHypnosisView对象
    self.uis= [[BNRHypnosisView alloc]init];
  
  //将BNRHypnosisView对象赋给视图控制器的view属性
    self.view = self.uis;

}
- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil
                           bundle:nibBundleOrNil];
    
    if (self) {
        //设置标签项的标题
        self.tabBarItem.title = @"Hypnotize";
        
        //从图像文件创建一个UIImage对象
        //在Retina 显示屏上会加载Hypno@2x.png,而不是Hypno.png
        UIImage *i = [UIImage imageNamed:@"Hypno.png"];
        
        //将UIImage对象赋给标签项的image属性
        self.tabBarItem.image = i ;
    }
    return self;
}
- (void)viewDidLoad
{
  //必须调用父类的viewDidLoad
    [super viewDidLoad];
    //BNRHypnosisView *siv = [[BNRHypnosisView alloc] init];
    NSLog(@"BNRHypnosisViewController loaded its view.");
    NSArray *array = [[NSArray alloc]initWithObjects:@"Red",@"Gree",@"Blue",nil];
    UISegmentedControl *sgc = [[UISegmentedControl alloc] initWithItems:array];
    sgc.frame = CGRectMake(200, 400, 100, 50);
    sgc.momentary = NO;
    [sgc addTarget:self action:@selector(onClickSegmentedControl:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:sgc];
   // [self.view addSubview:siv];
    [sgc setTintColor:[UIColor blackColor]];
   
}

- (void)onClickSegmentedControl:(UISegmentedControl *)segment
{
    
    UIColor *red = [[UIColor alloc] initWithRed:1.0 green:0.0
                                           blue:0.0
                                          alpha:1];
    
    UIColor *gree = [[UIColor alloc] initWithRed:0.0 green:1.0
                                            blue:0.0
                                           alpha:1];
    UIColor *blue = [[UIColor alloc] initWithRed:0.0 green:0.0
                                            blue:1.0
                                           alpha:1];
    
    if (segment.selectedSegmentIndex == 0) {
        self.uis.circleColor = red;
       
    }
    else if (segment.selectedSegmentIndex == 1) {
        self.uis.circleColor = gree;
    }
    else
        self.uis.circleColor = blue;

    
}

@end
