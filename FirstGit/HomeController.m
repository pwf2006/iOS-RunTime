//
//  HomeController.m
//  FirstGit
//
//  Created by pengweifeng on 8/3/16.
//  Copyright © 2016 pengweifeng. All rights reserved.
//

#import "HomeController.h"
#import <objc/runtime.h>

@interface HomeController (){
    int index;
    NSString *name1;
}

@property (nonatomic, strong) UILabel *msgLbl;

@end

@implementation HomeController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.msgLbl = [[UILabel alloc] init];
    self.msgLbl.font = [UIFont systemFontOfSize:14];
    self.msgLbl.textColor = [UIColor blackColor];
    self.msgLbl.text = @"主界面";
    self.msgLbl.textAlignment = NSTextAlignmentLeft;
    [self.view addSubview:self.msgLbl];
    
    [self getPropertyList];
    [self getIvarList];
    [self getInstanceMethodList];
    [self getClassMethodList];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    self.msgLbl.frame = CGRectMake(20, 40, 60, 20);
}

+ (void)classMethod {
    NSLog(@"****");
}
//获取类的属性
- (void)getPropertyList {
    //属性个数
    unsigned int count;
    objc_property_t *properties = class_copyPropertyList([self class], &count);
    
    for (int i = 0; i < count; i++) {
        objc_property_t property = properties[i];
        const char *name = property_getName(property);
        NSString *nameStr = [NSString stringWithCString:name encoding:NSUTF8StringEncoding];
        NSLog(@"***属性名:%@", nameStr);
    }
    free(properties);
}

- (void)getIvarList {
    unsigned int count;
    Ivar *ivarList = class_copyIvarList([self class], &count);
    for (int i = 0; i < count; i++) {
        NSString *nameStr = [NSString stringWithUTF8String:ivar_getName(ivarList[i])];
        NSLog(@"***ivarName:%@", nameStr);
    }
    free(ivarList);
}

//获取一个类的实例方法列表
- (void)getInstanceMethodList {
    unsigned int count; 
    Method *methods = class_copyMethodList([self class], &count);
    for (int i = 0; i < count; i++) {
        SEL name = method_getName(methods[i]);
        NSLog(@"***实例方法名:%@", NSStringFromSelector(name));
    }
    free(methods);
}

//获取一个类的类方法列表
- (void)getClassMethodList {
    unsigned int count;
//    const char * class_name = class_getName([self class]);
//    Class metaClass = objc_getMetaClass(class_name);
    Method *methods = class_copyMethodList(object_getClass([self class]), &count);
    for (int i = 0; i < count; i++) {
        SEL name = method_getName(methods[i]);
        NSLog(@"***类方法名:%@", NSStringFromSelector(name));
    }
    free(methods);
}
@end
