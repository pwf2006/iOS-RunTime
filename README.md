# FirstGit
###RunTime　　class_copyPropertyList　　class_copyIvarList　　class_copyMethodList
## 该工程主要讲述了运用运行时的一些特性来获取类的属性和方法,包含了以下四个方面
*   运行时获取类的properties
*   运行时获取类的ivars
*   运行获取类的instance methods
*   运行时获取类的 class methods

## 运行时获取类的properties  
    //获取类的属性
\- (void)getPropertyList {  
    //属性个数  
    unsigned int count;  
    objc_property_t *properties = class_copyPropertyList([self class], &count);
    
    for (int i = 0; i < count; i++) {
        objc_property_t property = properties[i];
        const char *name = property_getName(property);
        NSString *nameStr = [NSString stringWithCString:name encoding:NSUTF8StringEncoding];
        NSLog(@"***属性名:%@", nameStr);
    }
}
此种方法只能获取类的属性,像:  
    @interface HomeController (){   
        int index;  
        NSString *name1;    
}   
这种方法声明的"index"和"name1"属性是无法获取到的,如果获取该种属性则可使用class_copyIvarList()方法来获取.
## 运行时获取类ivars    
如果想要在运行的时候获取诸如:   
@interface HomeController (){
    int index;  
    NSString *name1;
}   

@property (nonatomic, strong) UILabel *msgLbl;

@end    
代码块中声明的"index","name1","msgLbl"属性,则可用class_copyIvarList(),详细使用见工程.


