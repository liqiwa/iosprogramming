//
//  BNRReminderViewController.m
//  
//
//  Created by 王琳琳 on 16/5/18.
//
//

#import "BNRReminderViewController.h"
@interface BNRReminderViewController ()
@property (nonatomic,weak) IBOutlet UIDatePicker *datePicker;
@end
@implementation BNRReminderViewController

- (IBAction)addReminder:(id)sender
{
    NSDate *date = self.datePicker.date;
    NSLog(@"Setting a reminder %@",date);
    UILocalNotification *note = [[UILocalNotification alloc] init];
    note.alertBody = @"Hypnotize me!";
    note.fireDate = date;
    
    //ios 8新的要求语句,不加上也可以正常运行，时间选择问题
    //UIUserNotificationSettings *local = [UIUserNotificationSettings settingsForTypes:1 << 2
    //                                                                      categories:nil];
    //[[UIApplication sharedApplication] registerUserNotificationSettings:local];
    [[UIApplication sharedApplication] scheduleLocalNotification:note];
    

}

- (instancetype)initWithNibName:(NSString *)nibNameOrNil
                         bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil
                           bundle:nibBundleOrNil];
    
    if (self) {
        //获取tabBarItem属性所指向的UITabBarItem对象
        UITabBarItem *tbi = self.tabBarItem;
        
        //设置UITabBarItem对象的标题
        tbi.title = @"Reminder";
        
        //设置UITabBarItem对象的图像
        UIImage *i = [UIImage imageNamed:@"Time.png"];
        tbi.image = i;
    }
    return self;


}
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSLog(@"BNRReminderViewController loaded its view.");

}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.datePicker.minimumDate = [NSDate dateWithTimeIntervalSinceNow:60];

}
@end
