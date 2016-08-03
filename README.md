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



