//
//  ViewController.m
//  登录界面
//
//  Created by 覃宗雷 on 2017/4/10.
//  Copyright © 2017年 leizongqin. All rights reserved.
//

#import "ViewController.h"



@interface ViewController ()

{
    
    UIButton*button;
    
    UIView*view1;
}


@property (nonatomic,strong) UITextField*userNameTextField;
@property (nonatomic,strong) UITextField*passWorldTextField;




@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    self.view.backgroundColor=[UIColor whiteColor];
    
    [self creatUI];
    
}

-(void)creatUI{
    
   view1=[[UIView alloc] initWithFrame:CGRectMake(0, 100, 320, 400)];
    view1.backgroundColor=[UIColor grayColor];
    [self.view addSubview:view1];
    
    _userNameTextField=[[UITextField alloc] initWithFrame:CGRectMake(100, 100, 200, 30)];
    _userNameTextField.text=@"用户名字";
    _userNameTextField.textColor=[UIColor redColor];
    _userNameTextField.placeholder=@"请输入账号";
    _userNameTextField.borderStyle=UITextBorderStyleRoundedRect;
    _userNameTextField.returnKeyType=UIReturnKeyGo;
    _userNameTextField.clearButtonMode=UITextFieldViewModeWhileEditing;
    [view1 addSubview:_userNameTextField];
    
    
    
    _passWorldTextField=[[UITextField alloc] initWithFrame:CGRectMake(100, CGRectGetMaxY(_userNameTextField.frame)+30, 200, 30)];
    _passWorldTextField.placeholder=@"请输入密码";
    _passWorldTextField.borderStyle=UITextBorderStyleRoundedRect;
    _passWorldTextField.returnKeyType=UIReturnKeyGo;
     _passWorldTextField.clearButtonMode=UITextFieldViewModeWhileEditing;
    [view1 addSubview:_passWorldTextField];
    
    
    
    [self addButtonWithFrame:CGRectMake(150, CGRectGetMaxY(_passWorldTextField.frame)+30, 100, 40) Title:@"登录" Tag:100];
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyBoardWillShow) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyBoardWillHide) name:UIKeyboardWillHideNotification object:nil];
}

-(void)keyBoardWillShow{


    view1.frame= CGRectMake(0, 50, 320, 400);
    

    //button.frame=CGRectMake(150, CGRectGetMaxY(_passWorldTextField.frame)+10, 100, 40);
}

-(void)keyBoardWillHide{
    
    //button.frame=CGRectMake(150, CGRectGetMaxY(_passWorldTextField.frame)+30, 100, 40);
    view1.frame=CGRectMake(0, 100, 320, 400);
    
    
}


-(void)addButtonWithFrame:(CGRect)frame
                    Title:(NSString*)title
                    Tag:(NSInteger)tag{
    
    button=[UIButton buttonWithType:UIButtonTypeCustom];
    button.frame=frame;
    button.tag=tag;
    button.backgroundColor=[UIColor grayColor];
    button.layer.cornerRadius=10;
    [button setTitle:title forState:UIControlStateNormal];
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [view1 addSubview:button];
    
    
}


-(void)buttonClick:(UIButton*)bt{
    
    if ([_userNameTextField.text isEqualToString:@"Admin"]&&[_passWorldTextField.text isEqualToString:@"123"]) {
        
        UIAlertView*alert=[[UIAlertView alloc ]initWithTitle:@"登录成功" message:nil delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
        [alert show];
       
    }
    
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    
    [self.view endEditing:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
