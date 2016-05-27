//
//  BNRQuizViewController.m
//  
//
//  Created by 王琳琳 on 16/5/3.
//
//

#import "BNRQuizViewController.h"

@interface BNRQuizViewController ()

@property (nonatomic) int currentQuestionIndex;

@property (nonatomic, copy) NSArray *questions;
@property (nonatomic, copy) NSArray *answers;

@property (nonatomic,weak) IBOutlet UILabel *questionLabel;
@property (nonatomic,weak) IBOutlet UILabel *answerLabel;
@end

@implementation BNRQuizViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil
                         bundle:(NSBundle *)nibBundleOrNil
{
  //调用父类实现的初始化方法
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        //获取tabBarItem属性所指向的UITabBarItem对象
        UITabBarItem *tbi = self.tabBarItem;
        
        //设置UITabBarItem对象的标题
        tbi.title = @"Quiz";
        
        //设置UITabBarItem对象的图像
        UIImage *i = [UIImage imageNamed:@"Time.png"];
        tbi.image = i;

        //创建两个数组对象，存储所需的问题和答案
        //同时，将questions和answers分别指向问题数组合答案数组
        
        self.questions = @[@"From what is cognac made?",
                           @"What is 7+7?",
                           @"What is the capital of Vermont?"];
        
        self.answers = @[@"Grapes",
                         @"14",
                         @"Montpelier"];
    }

    //返回新对象地址
    return self;
}
- (IBAction)showQuestion:(id)sender
{
  //进入下一个问题
    self.currentQuestionIndex++;
    
  //是否已经回答完了所有问题？
    if (self.currentQuestionIndex == [self.questions count]) {
        
        //回到第一个问题
        self.currentQuestionIndex = 0;
    }
    
    //根据正在回答的问题序号从数组中取出问题字符串
    
    NSString *question = self.questions[self.currentQuestionIndex];
    
    //将问题字符串显示在标签上
    self.questionLabel.text = question;
    
    //重置答案字符串
    self.answerLabel.text = @"???";
    


}

- (IBAction)showAnswer:(id)sender
{
   //当前问题的答案是什么？
    NSString *answer = self.answers[self.currentQuestionIndex];
   
    //在答案标签上显示相应的答案
    
    self.answerLabel.text = answer;


}
@end
