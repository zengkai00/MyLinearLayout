//
//  MyBaseLayout.m
//  MyLayout
//
//  Created by oybq on 15/6/14.
//  Copyright (c) 2015年 YoungSoft. All rights reserved.
//

#import "MyBaseLayout.h"
#import "MyLayoutInner.h"
#import "MyLayoutDelegate.h"
#import <objc/runtime.h>

const char * const ASSOCIATEDOBJECT_KEY_MYLAYOUT_FRAME = "ASSOCIATEDOBJECT_KEY_MYLAYOUT_FRAME";

void* _myObserverContextA = (void*)20175281;
void* _myObserverContextB = (void*)20175282;
void* _myObserverContextC = (void*)20175283;


@interface MyLayoutDragger()

@property(nonatomic, assign) NSUInteger currentIndex;
@property(nonatomic, assign) NSUInteger oldIndex;
@property(nonatomic, assign) BOOL hasDragging;
@property(nonatomic, weak) MyBaseLayout *layout;

@end


/**
 窗口对RTL的支持。
 */

@interface UIWindow (MyLayoutExt)

-(void)myUpdateRTL:(BOOL)isRTL;

@end


@implementation UIView(MyLayoutExt)

-(MyLayoutPos*)topPos
{
    return self.myCurrentSizeClass.topPos;
}

-(MyLayoutPos*)leadingPos
{
    return self.myCurrentSizeClass.leadingPos;
}

-(MyLayoutPos*)bottomPos
{
    return self.myCurrentSizeClass.bottomPos;
}

-(MyLayoutPos*)trailingPos
{
    return self.myCurrentSizeClass.trailingPos;
}

-(MyLayoutPos*)centerXPos
{
    return self.myCurrentSizeClass.centerXPos;
}

-(MyLayoutPos*)centerYPos
{
   return  self.myCurrentSizeClass.centerYPos;
}

-(MyLayoutPos*)leftPos
{
    return self.myCurrentSizeClass.leftPos;
}

-(MyLayoutPos*)rightPos
{
    return self.myCurrentSizeClass.rightPos;
}

-(MyLayoutPos*)baselinePos
{
    return self.myCurrentSizeClass.baselinePos;
}

-(CGFloat)myTop
{
#if DEBUG
    NSLog(@"%s 一般只用于设置，而不能用于获取！！", sel_getName(_cmd));
#endif
    return self.myCurrentSizeClass.myTop;
}

-(void)setMyTop:(CGFloat)myTop
{
    self.myCurrentSizeClass.myTop = myTop;
}

-(CGFloat)myLeading
{
#if DEBUG
    NSLog(@"%s 一般只用于设置，而不能用于获取！！", sel_getName(_cmd));
#endif
    return self.myCurrentSizeClass.myLeading;
}

-(void)setMyLeading:(CGFloat)myLeading
{
    self.myCurrentSizeClass.myLeading = myLeading;
}

-(CGFloat)myBottom
{
#if DEBUG
    NSLog(@"%s 一般只用于设置，而不能用于获取！！", sel_getName(_cmd));
#endif
    return self.myCurrentSizeClass.myBottom;
}

-(void)setMyBottom:(CGFloat)myBottom
{
    self.myCurrentSizeClass.myBottom = myBottom;
}

-(CGFloat)myTrailing
{
#if DEBUG
    NSLog(@"%s 一般只用于设置，而不能用于获取！！", sel_getName(_cmd));
#endif
    return self.myCurrentSizeClass.myTrailing;
}

-(void)setMyTrailing:(CGFloat)myTrailing
{
    self.myCurrentSizeClass.myTrailing = myTrailing;
}

-(CGFloat)myCenterX
{
#if DEBUG
    NSLog(@"%s 一般只用于设置，而不能用于获取！！", sel_getName(_cmd));
#endif
    return self.myCurrentSizeClass.myCenterX;
}

-(void)setMyCenterX:(CGFloat)myCenterX
{
    self.myCurrentSizeClass.myCenterX = myCenterX;
}

-(CGFloat)myCenterY
{
#if DEBUG
    NSLog(@"%s 一般只用于设置，而不能用于获取！！", sel_getName(_cmd));
#endif
    return self.myCurrentSizeClass.myCenterY;
}

-(void)setMyCenterY:(CGFloat)myCenterY
{
    self.myCurrentSizeClass.myCenterY = myCenterY;
}

-(CGPoint)myCenter
{
#if DEBUG
    NSLog(@"%s 一般只用于设置，而不能用于获取！！", sel_getName(_cmd));
#endif
    return self.myCurrentSizeClass.myCenter;
}

-(void)setMyCenter:(CGPoint)myCenter
{
    self.myCurrentSizeClass.myCenter = myCenter;
}

-(CGFloat)myLeft
{
#if DEBUG
    NSLog(@"%s 一般只用于设置，而不能用于获取！！", sel_getName(_cmd));
#endif
    return self.myCurrentSizeClass.myLeft;
}

-(void)setMyLeft:(CGFloat)myLeft
{
    self.myCurrentSizeClass.myLeft = myLeft;
}

-(CGFloat)myRight
{
#if DEBUG
    NSLog(@"%s 一般只用于设置，而不能用于获取！！", sel_getName(_cmd));
#endif
    return self.myCurrentSizeClass.myRight;
}

-(void)setMyRight:(CGFloat)myRight
{
    self.myCurrentSizeClass.myRight = myRight;
}

-(CGFloat)myMargin
{
#if DEBUG
    NSLog(@"%s 一般只用于设置，而不能用于获取！！", sel_getName(_cmd));
#endif
    return self.myCurrentSizeClass.myMargin;
}

-(void)setMyMargin:(CGFloat)myMargin
{
    self.myCurrentSizeClass.myMargin = myMargin;
}

-(CGFloat)myHorzMargin
{
#if DEBUG
    NSLog(@"%s 一般只用于设置，而不能用于获取！！", sel_getName(_cmd));
#endif
    return self.myCurrentSizeClass.myHorzMargin;
}

-(void)setMyHorzMargin:(CGFloat)myHorzMargin
{
    self.myCurrentSizeClass.myHorzMargin = myHorzMargin;
}

-(CGFloat)myVertMargin
{
#if DEBUG
    NSLog(@"%s 一般只用于设置，而不能用于获取！！", sel_getName(_cmd));
#endif
    return self.myCurrentSizeClass.myVertMargin;
}

-(void)setMyVertMargin:(CGFloat)myVertMargin
{
    self.myCurrentSizeClass.myVertMargin = myVertMargin;
}

-(MyLayoutSize*)widthSize
{
    return self.myCurrentSizeClass.widthSize;
}

-(MyLayoutSize*)heightSize
{
    return self.myCurrentSizeClass.heightSize;
}

-(CGFloat)myWidth
{
    return self.myCurrentSizeClass.myWidth;
}

-(void)setMyWidth:(CGFloat)myWidth
{
    self.myCurrentSizeClass.myWidth = myWidth;
}

-(CGFloat)myHeight
{
    return self.myCurrentSizeClass.myHeight;
}

-(void)setMyHeight:(CGFloat)myHeight
{
    self.myCurrentSizeClass.myHeight = myHeight;
}

-(CGSize)mySize
{
#if DEBUG
    NSLog(@"%s 一般只用于设置，而不能用于获取！！", sel_getName(_cmd));
#endif
    
    return self.myCurrentSizeClass.mySize;
}

-(void)setMySize:(CGSize)mySize
{
    self.myCurrentSizeClass.mySize = mySize;
}

-(void)setWrapContentHeight:(BOOL)wrapContentHeight
{
    UIView *sc = self.myCurrentSizeClass;
    if (sc.wrapContentHeight != wrapContentHeight)
    {
        sc.wrapContentHeight = wrapContentHeight;
        if (self.superview != nil)
            [self.superview setNeedsLayout];
    }
}

-(BOOL)wrapContentHeight
{
    //特殊处理，减少不必要的对象创建
    return self.myCurrentSizeClassInner.wrapContentHeight;
}

-(void)setWrapContentWidth:(BOOL)wrapContentWidth
{
    UIView *sc = self.myCurrentSizeClass;
    if (sc.wrapContentWidth != wrapContentWidth)
    {
        sc.wrapContentWidth = wrapContentWidth;
        if (self.superview != nil)
            [self.superview setNeedsLayout];
    }
}

-(BOOL)wrapContentWidth
{
    //特殊处理，减少不必要的对象创建
    return self.myCurrentSizeClassInner.wrapContentWidth;
}

-(BOOL)wrapContentSize
{
    return self.myCurrentSizeClassInner.wrapContentSize;
}

-(void)setWrapContentSize:(BOOL)wrapContentSize
{
    UIView *sc = self.myCurrentSizeClass;
    sc.wrapContentSize = wrapContentSize;
    if (self.superview != nil)
        [self.superview setNeedsLayout];
}

-(CGFloat)weight
{
    return self.myCurrentSizeClass.weight;
}

-(void)setWeight:(CGFloat)weight
{
    UIView *sc = self.myCurrentSizeClass;
    if (sc.weight != weight)
    {
        sc.weight = weight;
        if (self.superview != nil)
            [self.superview setNeedsLayout];
    }
}

-(BOOL)useFrame
{
    return self.myCurrentSizeClass.useFrame;
}

-(void)setUseFrame:(BOOL)useFrame
{
    UIView *sc = self.myCurrentSizeClass;
    if (sc.useFrame != useFrame)
    {
        sc.useFrame = useFrame;
        if (self.superview != nil)
            [ self.superview setNeedsLayout];
    }
}

-(BOOL)noLayout
{
    return self.myCurrentSizeClass.noLayout;
}

-(void)setNoLayout:(BOOL)noLayout
{
    UIView *sc = self.myCurrentSizeClass;
    if (sc.noLayout != noLayout)
    {
        sc.noLayout = noLayout;
        if (self.superview != nil)
            [ self.superview setNeedsLayout];
    }
}

-(MyVisibility)visibility
{
    return self.myCurrentSizeClass.visibility;
}

-(void)setVisibility:(MyVisibility)visibility
{
    UIView *sc = self.myCurrentSizeClass;
    if (sc.visibility != visibility)
    {
        sc.visibility = visibility;
        if (visibility == MyVisibility_Visible)
            self.hidden = NO;
        else
            self.hidden = YES;
        
        if (self.superview != nil)
            [ self.superview setNeedsLayout];
    }
}

-(MyVisibility)myVisibility
{
    return self.visibility;
}

-(void)setMyVisibility:(MyVisibility)myVisibility
{
    self.visibility = myVisibility;
}

-(MyGravity)alignment
{
    return self.myCurrentSizeClass.alignment;
}

-(void)setAlignment:(MyGravity)alignment
{
    UIView *sc = self.myCurrentSizeClass;
    if (sc.alignment != alignment)
    {
        sc.alignment = alignment;
        if (self.superview != nil)
            [ self.superview setNeedsLayout];
    }
}

-(void)setMyAlignment:(MyGravity)myAlignment
{
    self.alignment = myAlignment;
}

-(MyGravity)myAlignment
{
    return self.alignment;
}

-(void (^)(MyBaseLayout*, UIView*))viewLayoutCompleteBlock
{
    return self.myCurrentSizeClass.viewLayoutCompleteBlock;
}

-(void)setViewLayoutCompleteBlock:(void (^)(MyBaseLayout *, UIView *))viewLayoutCompleteBlock
{
    self.myCurrentSizeClass.viewLayoutCompleteBlock = viewLayoutCompleteBlock;
}

-(CGRect)estimatedRect
{
    CGRect rect = self.myFrame.frame;
    if (rect.size.width == CGFLOAT_MAX || rect.size.height == CGFLOAT_MAX)
        return self.frame;
    return rect;
}

-(void)resetMyLayoutSetting
{
    [self resetMyLayoutSettingInSizeClass:MySizeClass_wAny | MySizeClass_hAny];
}

-(void)resetMyLayoutSettingInSizeClass:(MySizeClass)sizeClass
{
    [self.myFrame.sizeClasses removeObjectForKey:@(sizeClass)];
}

-(instancetype)fetchLayoutSizeClass:(MySizeClass)sizeClass
{
    return [self fetchLayoutSizeClass:sizeClass copyFrom:0xFF];
}

-(instancetype)fetchLayoutSizeClass:(MySizeClass)sizeClass copyFrom:(MySizeClass)srcSizeClass
{
    MyFrame *myFrame = self.myFrame;
    if (myFrame.sizeClasses == nil)
        myFrame.sizeClasses = [NSMutableDictionary new];
    
    MyViewSizeClass *myLayoutSizeClass = (MyViewSizeClass*)[myFrame.sizeClasses objectForKey:@(sizeClass)];
    if (myLayoutSizeClass == nil)
    {
        MyViewSizeClass *srcLayoutSizeClass = (MyViewSizeClass*)[myFrame.sizeClasses objectForKey:@(srcSizeClass)];
        if (srcLayoutSizeClass == nil)
            myLayoutSizeClass = [self createSizeClassInstance];
        else
            myLayoutSizeClass = [srcLayoutSizeClass copy];
        myLayoutSizeClass.view = self;
        [myFrame.sizeClasses setObject:myLayoutSizeClass forKey:@(sizeClass)];
    }
    
    return (UIView*)myLayoutSizeClass;
}

@end


@implementation UIView(MyLayoutExtInner)

-(instancetype)myDefaultSizeClass
{
    return [self fetchLayoutSizeClass:MySizeClass_wAny | MySizeClass_hAny];
}

-(instancetype)myCurrentSizeClass
{
    MyFrame *myFrame = self.myFrame;  //减少多次访问，增加性能。
    return [self myCurrentSizeClassFrom:myFrame];
}

-(instancetype)myCurrentSizeClassInner
{
    //如果没有则不会建立，为了优化减少不必要的建立。
    MyFrame *obj = objc_getAssociatedObject(self, ASSOCIATEDOBJECT_KEY_MYLAYOUT_FRAME);
    return obj.sizeClass;
}

-(instancetype)myCurrentSizeClassFrom:(MyFrame*)myFrame
{
    if (myFrame.sizeClass == nil)
        myFrame.sizeClass = [self myDefaultSizeClass];
    
    return myFrame.sizeClass;
}

-(instancetype)myBestSizeClass:(MySizeClass)sizeClass myFrame:(MyFrame*)myFrame
{
    MySizeClass wsc = sizeClass & 0x03;
    MySizeClass hsc = sizeClass & 0x0C;
    MySizeClass ori = sizeClass & 0xC0;
    
    if (myFrame.sizeClasses == nil)
        myFrame.sizeClasses = [NSMutableDictionary new];
    
    MySizeClass searchSizeClass;
    MyViewSizeClass *myClass = nil;
    if (myFrame.multiple)
    {
        //first search the most exact SizeClass
        searchSizeClass = wsc | hsc | ori;
        myClass = (MyViewSizeClass*)[myFrame.sizeClasses objectForKey:@(searchSizeClass)];
        if (myClass != nil)
            return (UIView*)myClass;
        
        
        searchSizeClass = wsc | hsc;
        if (searchSizeClass != sizeClass)
        {
            MyViewSizeClass *myClass = (MyViewSizeClass*)[myFrame.sizeClasses objectForKey:@(searchSizeClass)];
            if (myClass != nil)
                return (UIView*)myClass;
        }
        
        searchSizeClass = MySizeClass_wAny | hsc | ori;
        if (ori != 0 && searchSizeClass != sizeClass)
        {
            myClass = (MyViewSizeClass*)[myFrame.sizeClasses objectForKey:@(searchSizeClass)];
            if (myClass != nil)
                return (UIView*)myClass;
        }
        
        searchSizeClass = MySizeClass_wAny | hsc;
        if (searchSizeClass != sizeClass)
        {
            myClass = (MyViewSizeClass*)[myFrame.sizeClasses objectForKey:@(searchSizeClass)];
            if (myClass != nil)
                return (UIView*)myClass;
        }
        
        searchSizeClass = wsc | MySizeClass_hAny | ori;
        if (ori != 0 && searchSizeClass != sizeClass)
        {
            myClass = (MyViewSizeClass*)[myFrame.sizeClasses objectForKey:@(searchSizeClass)];
            if (myClass != nil)
                return (UIView*)myClass;
        }
        
        searchSizeClass = wsc | MySizeClass_hAny;
        if (searchSizeClass != sizeClass)
        {
            myClass = (MyViewSizeClass*)[myFrame.sizeClasses objectForKey:@(searchSizeClass)];
            if (myClass != nil)
                return (UIView*)myClass;
        }
        
        searchSizeClass = MySizeClass_wAny | MySizeClass_hAny | ori;
        if (ori != 0 && searchSizeClass != sizeClass)
        {
            myClass = (MyViewSizeClass*)[myFrame.sizeClasses objectForKey:@(searchSizeClass)];
            if (myClass != nil)
                return (UIView*)myClass;
        }
    }
    
    searchSizeClass = MySizeClass_wAny | MySizeClass_hAny;
    myClass = (MyViewSizeClass*)[myFrame.sizeClasses objectForKey:@(searchSizeClass)];
    if (myClass == nil)
    {
        myClass = [self createSizeClassInstance];
        myClass.view = self;
        [myFrame.sizeClasses setObject:myClass forKey:@(searchSizeClass)];
    }
    
    return (UIView*)myClass;
}


-(MyFrame*)myFrame
{
    MyFrame *obj = objc_getAssociatedObject(self, ASSOCIATEDOBJECT_KEY_MYLAYOUT_FRAME);
    if (obj == nil)
    {
        obj = [MyFrame new];
        objc_setAssociatedObject(self, ASSOCIATEDOBJECT_KEY_MYLAYOUT_FRAME, obj, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    
    return obj;
}

-(id)createSizeClassInstance
{
    return [MyViewSizeClass new];
}

-(MyLayoutPos*)topPosInner
{
    return self.myCurrentSizeClass.topPosInner;
}

-(MyLayoutPos*)leadingPosInner
{
    return self.myCurrentSizeClass.leadingPosInner;
}

-(MyLayoutPos*)bottomPosInner
{
    return self.myCurrentSizeClass.bottomPosInner;
}

-(MyLayoutPos*)trailingPosInner
{
    return self.myCurrentSizeClass.trailingPosInner;
}

-(MyLayoutPos*)centerXPosInner
{
    return self.myCurrentSizeClass.centerXPosInner;
}

-(MyLayoutPos*)centerYPosInner
{
    return self.myCurrentSizeClass.centerYPosInner;
}

-(MyLayoutPos*)leftPosInner
{
   return self.myCurrentSizeClass.leftPosInner;
}

-(MyLayoutPos*)rightPosInner
{
   return self.myCurrentSizeClass.rightPosInner;
}

-(MyLayoutPos*)baselinePosInner
{
    return self.myCurrentSizeClass.baselinePosInner;
}

-(MyLayoutSize*)widthSizeInner
{
    return self.myCurrentSizeClass.widthSizeInner;
}

-(MyLayoutSize*)heightSizeInner
{
   return self.myCurrentSizeClass.heightSizeInner;
}

-(CGFloat)myEstimatedWidth
{
    //如果视图的父视图不是布局视图则直接返回宽度值。
    if (![self.superview isKindOfClass:[MyBaseLayout class]])
    {
        return CGRectGetWidth(self.bounds);
    }
    else
    {
        MyFrame *myFrame = self.myFrame;
        if (myFrame.width == CGFLOAT_MAX)
            return CGRectGetWidth(self.bounds);
        return myFrame.width;
    }
}

-(CGFloat)myEstimatedHeight
{
    if (![self.superview isKindOfClass:[MyBaseLayout class]])
    {
        return CGRectGetHeight(self.bounds);
    }
    else
    {
        MyFrame *myFrame = self.myFrame;
        if (myFrame.height == CGFLOAT_MAX)
            return CGRectGetHeight(self.bounds);
        return myFrame.height;
    }
}

@end



@implementation MyBaseLayout
{
    MyLayoutTouchEventDelegate *_touchEventDelegate;
    MyBorderlineLayerDelegate *_borderlineLayerDelegate;
    BOOL _isAddSuperviewKVO;
    BOOL _useCacheRects;
    MyBaseLayoutOptionalData *_optionalData;
}

-(void)dealloc
{
    //如果您在使用时出现了KVO的异常崩溃，原因是您将这个视图被多次加入为子视图，请检查您的代码，是否这个视图被多次加入！！
    _optionalData = nil;
}

#pragma  mark -- Public Methods

+(BOOL)isRTL
{
    return [MyViewSizeClass isRTL];
}

+(void)setIsRTL:(BOOL)isRTL
{
    [MyViewSizeClass setIsRTL:isRTL];
}

+ (void)updateRTL:(BOOL)isRTL inWindow:(UIWindow *)window
{
    [window myUpdateRTL:isRTL];
}
+ (void)myUpArabicUI:(BOOL)isArabicUI inWindow:(UIWindow *)window
{
    [self updateRTL:isArabicUI inWindow:window];
}

-(CGFloat)topPadding
{
    return self.myCurrentSizeClass.topPadding;
}

-(void)setTopPadding:(CGFloat)topPadding
{
    MyBaseLayout *lsc = self.myCurrentSizeClass;
    if (lsc.topPadding != topPadding)
    {
        lsc.topPadding = topPadding;
        [self setNeedsLayout];
    }
}

-(CGFloat)leadingPadding
{
    return self.myCurrentSizeClass.leadingPadding;
}

-(void)setLeadingPadding:(CGFloat)leadingPadding
{
    MyBaseLayout *lsc = self.myCurrentSizeClass;
    if (lsc.leadingPadding != leadingPadding)
    {
        lsc.leadingPadding = leadingPadding;
        [self setNeedsLayout];
    }
}

-(CGFloat)bottomPadding
{
    return self.myCurrentSizeClass.bottomPadding;
}

-(void)setBottomPadding:(CGFloat)bottomPadding
{
    MyBaseLayout *lsc = self.myCurrentSizeClass;
    if (lsc.bottomPadding != bottomPadding)
    {
        lsc.bottomPadding = bottomPadding;
        [self setNeedsLayout];
    }
}

-(CGFloat)trailingPadding
{
    return self.myCurrentSizeClass.trailingPadding;
}

-(void)setTrailingPadding:(CGFloat)trailingPadding
{
    MyBaseLayout *lsc = self.myCurrentSizeClass;
    if (lsc.trailingPadding != trailingPadding)
    {
        lsc.trailingPadding = trailingPadding;
        [self setNeedsLayout];
    }
}

-(UIEdgeInsets)padding
{
    return self.myCurrentSizeClass.padding;
}

-(void)setPadding:(UIEdgeInsets)padding
{
    MyBaseLayout *lsc = self.myCurrentSizeClass;
    if (!UIEdgeInsetsEqualToEdgeInsets(lsc.padding, padding))
    {
        lsc.padding = padding;
        [self setNeedsLayout];
    }
}

-(CGFloat)leftPadding
{
    return self.myCurrentSizeClass.leftPadding;
}

-(void)setLeftPadding:(CGFloat)leftPadding
{
    MyBaseLayout *lsc = self.myCurrentSizeClass;
    if (lsc.leftPadding != leftPadding)
    {
        lsc.leftPadding = leftPadding;
        [self setNeedsLayout];
    }
}

-(CGFloat)rightPadding
{
    return self.myCurrentSizeClass.rightPadding;
}

-(void)setRightPadding:(CGFloat)rightPadding
{
    MyBaseLayout *lsc = self.myCurrentSizeClass;
    if (lsc.rightPadding != rightPadding)
    {
        lsc.rightPadding = rightPadding;
        [self setNeedsLayout];
    }
}

-(BOOL)zeroPadding
{
    return self.myCurrentSizeClass.zeroPadding;
}

-(void)setZeroPadding:(BOOL)zeroPadding
{
    MyBaseLayout *lsc = self.myCurrentSizeClass;
    if (lsc.zeroPadding != zeroPadding)
    {
        lsc.zeroPadding = zeroPadding;
        [self setNeedsLayout];
    }
}

-(UIRectEdge)insetsPaddingFromSafeArea
{
    return self.myCurrentSizeClass.insetsPaddingFromSafeArea;
}

-(void)setInsetsPaddingFromSafeArea:(UIRectEdge)insetsPaddingFromSafeArea
{
    MyBaseLayout *lsc = self.myCurrentSizeClass;
    if (lsc.insetsPaddingFromSafeArea != insetsPaddingFromSafeArea)
    {
        lsc.insetsPaddingFromSafeArea = insetsPaddingFromSafeArea;
        [self setNeedsLayout];
    }
}

-(BOOL)insetLandscapeFringePadding
{
    return self.myCurrentSizeClass.insetLandscapeFringePadding;
}

-(void)setInsetLandscapeFringePadding:(BOOL)insetLandscapeFringePadding
{
    MyBaseLayout *lsc = self.myCurrentSizeClass;
    if (lsc.insetLandscapeFringePadding != insetLandscapeFringePadding)
    {
        lsc.insetLandscapeFringePadding = insetLandscapeFringePadding;
        [self setNeedsLayout];
    }
}

-(void)setSubviewHSpace:(CGFloat)subviewHSpace
{
    MyBaseLayout *lsc = self.myCurrentSizeClass;
    
    if (lsc.subviewHSpace != subviewHSpace)
    {
        lsc.subviewHSpace = subviewHSpace;
        [self setNeedsLayout];
    }
}

-(CGFloat)subviewHSpace
{
    return self.myCurrentSizeClass.subviewHSpace;
}

-(void)setSubviewVSpace:(CGFloat)subviewVSpace
{
    MyBaseLayout *lsc = self.myCurrentSizeClass;
    if (lsc.subviewVSpace != subviewVSpace)
    {
        lsc.subviewVSpace = subviewVSpace;
        [self setNeedsLayout];
    }
}

-(CGFloat)subviewVSpace
{
    return self.myCurrentSizeClass.subviewVSpace;
}

-(void)setSubviewSpace:(CGFloat)subviewSpace
{
    MyBaseLayout *lsc = self.myCurrentSizeClass;
    
    if (lsc.subviewSpace != subviewSpace)
    {
        lsc.subviewSpace = subviewSpace;
        [self setNeedsLayout];
    }
}

-(CGFloat)subviewSpace
{
    return self.myCurrentSizeClass.subviewSpace;
}

-(void)setGravity:(MyGravity)gravity
{
    MyBaseLayout *lsc = self.myCurrentSizeClass;
    if (lsc.gravity != gravity)
    {
        lsc.gravity = gravity;
        [self setNeedsLayout];
    }
}

-(MyGravity)gravity
{
    return self.myCurrentSizeClass.gravity;
}

-(void)setReverseLayout:(BOOL)reverseLayout
{
    MyBaseLayout *lsc = self.myCurrentSizeClass;
    if (lsc.reverseLayout != reverseLayout)
    {
        lsc.reverseLayout = reverseLayout;
        [self setNeedsLayout];
    }
}

-(BOOL)reverseLayout
{
    return self.myCurrentSizeClass.reverseLayout;
}

-(CGAffineTransform)layoutTransform
{
    return self.myCurrentSizeClass.layoutTransform;
}

-(void)setLayoutTransform:(CGAffineTransform)layoutTransform
{
    MyBaseLayout *lsc = self.myCurrentSizeClass;
    if (!CGAffineTransformEqualToTransform(lsc.layoutTransform, layoutTransform))
    {
        lsc.layoutTransform = layoutTransform;
        [self setNeedsLayout];
    }
}

-(void)removeAllSubviews
{
    [self.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
}



-(MyBorderline*)topBorderline
{
    return _borderlineLayerDelegate.topBorderline;
}

-(void)setTopBorderline:(MyBorderline *)topBorderline
{
    if (_borderlineLayerDelegate == nil)
        _borderlineLayerDelegate = [[MyBorderlineLayerDelegate alloc] initWithLayoutLayer:self.layer];
    
    _borderlineLayerDelegate.topBorderline = topBorderline;
}

-(MyBorderline*)leadingBorderline
{
    return _borderlineLayerDelegate.leadingBorderline;
}

-(void)setLeadingBorderline:(MyBorderline *)leadingBorderline
{
    if (_borderlineLayerDelegate == nil)
        _borderlineLayerDelegate = [[MyBorderlineLayerDelegate alloc] initWithLayoutLayer:self.layer];
    
    _borderlineLayerDelegate.leadingBorderline = leadingBorderline;
}

-(MyBorderline*)bottomBorderline
{
    return _borderlineLayerDelegate.bottomBorderline;
}

-(void)setBottomBorderline:(MyBorderline *)bottomBorderline
{
    if (_borderlineLayerDelegate == nil)
        _borderlineLayerDelegate = [[MyBorderlineLayerDelegate alloc] initWithLayoutLayer:self.layer];
    
    _borderlineLayerDelegate.bottomBorderline = bottomBorderline;
}

-(MyBorderline*)trailingBorderline
{
    return _borderlineLayerDelegate.trailingBorderline;
}

-(void)setTrailingBorderline:(MyBorderline *)trailingBorderline
{
    if (_borderlineLayerDelegate == nil)
        _borderlineLayerDelegate = [[MyBorderlineLayerDelegate alloc] initWithLayoutLayer:self.layer];
    
    _borderlineLayerDelegate.trailingBorderline = trailingBorderline;
}

-(MyBorderline*)leftBorderline
{
    return _borderlineLayerDelegate.leftBorderline;
}

-(void)setLeftBorderline:(MyBorderline *)leftBorderline
{
    if (_borderlineLayerDelegate == nil)
        _borderlineLayerDelegate = [[MyBorderlineLayerDelegate alloc] initWithLayoutLayer:self.layer];
    
    _borderlineLayerDelegate.leftBorderline = leftBorderline;
}

-(MyBorderline*)rightBorderline
{
    return _borderlineLayerDelegate.rightBorderline;
}

-(void)setRightBorderline:(MyBorderline *)rightBorderline
{
    if (_borderlineLayerDelegate == nil)
        _borderlineLayerDelegate = [[MyBorderlineLayerDelegate alloc] initWithLayoutLayer:self.layer];
    
    _borderlineLayerDelegate.rightBorderline = rightBorderline;
}

-(void)setBoundBorderline:(MyBorderline *)boundBorderline
{
    self.leadingBorderline = boundBorderline;
    self.trailingBorderline = boundBorderline;
    self.topBorderline = boundBorderline;
    self.bottomBorderline = boundBorderline;
}

-(MyBorderline*)boundBorderline
{
    return self.bottomBorderline;
}

-(void)setBackgroundImage:(UIImage *)backgroundImage
{
    if (_backgroundImage != backgroundImage)
    {
        _backgroundImage = backgroundImage;
        self.layer.contents = (id)_backgroundImage.CGImage;
    }
}

-(void)setCacheEstimatedRect:(BOOL)cacheEstimatedRect
{
    _cacheEstimatedRect = cacheEstimatedRect;
    _useCacheRects = NO;
}

-(CGRect)subview:(UIView*)subview estimatedRectInLayoutSize:(CGSize)size
{
    if (subview.superview == self)
        return subview.frame;
    
    NSMutableArray *sbs = [self myGetLayoutSubviews];
    [sbs addObject:subview];
    
    [self myEstimateLayoutSize:size inSizeClass:MySizeClass_wAny | MySizeClass_hAny sbs:sbs];
    
    return [subview estimatedRect];
}

-(void)setHighlightedOpacity:(CGFloat)highlightedOpacity
{
    if (_touchEventDelegate == nil)
        _touchEventDelegate = [[MyLayoutTouchEventDelegate alloc] initWithLayout:self];
    
    _touchEventDelegate.highlightedOpacity = highlightedOpacity;
}

-(CGFloat)highlightedOpacity
{
    return _touchEventDelegate.highlightedOpacity;
}

-(void)setHighlightedBackgroundColor:(UIColor *)highlightedBackgroundColor
{
    if (_touchEventDelegate == nil)
        _touchEventDelegate = [[MyLayoutTouchEventDelegate alloc] initWithLayout:self];
    
    _touchEventDelegate.highlightedBackgroundColor = highlightedBackgroundColor;
}

-(UIColor*)highlightedBackgroundColor
{
    return _touchEventDelegate.highlightedBackgroundColor;
}

-(void)setHighlightedBackgroundImage:(UIImage *)highlightedBackgroundImage
{
    if (_touchEventDelegate == nil)
        _touchEventDelegate = [[MyLayoutTouchEventDelegate alloc] initWithLayout:self];
    
    _touchEventDelegate.highlightedBackgroundImage = highlightedBackgroundImage;
}

-(UIImage*)highlightedBackgroundImage
{
    return _touchEventDelegate.highlightedBackgroundImage;
}

-(void)setTarget:(id)target action:(SEL)action
{
    if (_touchEventDelegate == nil)
        _touchEventDelegate = [[MyLayoutTouchEventDelegate alloc] initWithLayout:self];
    
    [_touchEventDelegate setTarget:target action:action];
}

-(void)setTouchDownTarget:(id)target action:(SEL)action
{
    if (_touchEventDelegate == nil)
        _touchEventDelegate = [[MyLayoutTouchEventDelegate alloc] initWithLayout:self];

    [_touchEventDelegate setTouchDownTarget:target action:action];
}

-(void)setTouchCancelTarget:(id)target action:(SEL)action
{
    if (_touchEventDelegate == nil)
        _touchEventDelegate = [[MyLayoutTouchEventDelegate alloc] initWithLayout:self];
    
    [_touchEventDelegate setTouchCancelTarget:target action:action];
}

-(MyLayoutDragger*)createLayoutDragger
{
    MyLayoutDragger *dragger = [MyLayoutDragger new];
    dragger.currentIndex = -1;
    dragger.oldIndex = -1;
    dragger.hasDragging = NO;
    dragger.layout = self;
    return dragger;
}

-(void)setBeginLayoutBlock:(void (^)(void))beginLayoutBlock
{
    if (_optionalData == nil)
        _optionalData = [MyBaseLayoutOptionalData new];
    _optionalData.beginLayoutBlock = beginLayoutBlock;
}

-(void (^)(void))beginLayoutBlock
{
    return _optionalData.beginLayoutBlock;
}

-(void)setEndLayoutBlock:(void (^)(void))endLayoutBlock
{
    if (_optionalData == nil)
        _optionalData = [MyBaseLayoutOptionalData new];
    _optionalData.endLayoutBlock = endLayoutBlock;
}

-(void (^)(void))endLayoutBlock
{
    return _optionalData.endLayoutBlock;
}

-(void)setRotationToDeviceOrientationBlock:(void (^)(MyBaseLayout *, BOOL, BOOL))rotationToDeviceOrientationBlock
{
    if (_optionalData == nil)
        _optionalData = [MyBaseLayoutOptionalData new];
    _optionalData.rotationToDeviceOrientationBlock = rotationToDeviceOrientationBlock;
}

-(void (^)(MyBaseLayout *, BOOL, BOOL))rotationToDeviceOrientationBlock
{
    return _optionalData.rotationToDeviceOrientationBlock;
}

-(void)layoutAnimationWithDuration:(NSTimeInterval)duration
{
    [self layoutAnimationWithDuration:duration options:0 completion:nil];
}
-(void)layoutAnimationWithDuration:(NSTimeInterval)duration options:(UIViewAnimationOptions)options completion:(void (^ __nullable)(BOOL finished))completion
{
    if (_optionalData == nil)
        _optionalData = [MyBaseLayoutOptionalData new];
    _optionalData.aniDuration = duration;
    _optionalData.aniOptions = options;
    _optionalData.aniCompletion = completion;
}


#pragma mark -- Touches Event

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [_touchEventDelegate touchesBegan:touches withEvent:event];
    [super touchesBegan:touches withEvent:event];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    [_touchEventDelegate touchesMoved:touches withEvent:event];
    [super touchesMoved:touches withEvent:event];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [_touchEventDelegate touchesEnded:touches withEvent:event];
    [super touchesEnded:touches withEvent:event];
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
    [_touchEventDelegate touchesCancelled:touches withEvent:event];
    [super touchesCancelled:touches withEvent:event];
}

#pragma mark -- KVO

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(UIView*)object change:(NSDictionary *)change context:(void *)context
{
    //监控非布局父视图的frame的变化，而改变自身的位置和尺寸
    if (context == _myObserverContextC)
    {
        //只监控父视图的尺寸变换
        CGRect rcOld = [change[NSKeyValueChangeOldKey] CGRectValue];
        CGRect rcNew = [change[NSKeyValueChangeNewKey] CGRectValue];
        if (!_myCGSizeEqual(rcOld.size, rcNew.size))
            [self myUpdateLayoutRectInNoLayoutSuperview:object];
        return;
    }
    
    //监控子视图的frame的变化以便重新进行布局
    if (!_isMyLayouting)
    {
        if (context == _myObserverContextA)
        {
            [self setNeedsLayout];
            //这里添加的原因是有可能子视图取消隐藏后不会绘制自身，所以这里要求子视图重新绘制自身
            if ([keyPath isEqualToString:@"hidden"] && ![change[NSKeyValueChangeNewKey] boolValue])
                [(UIView*)object setNeedsDisplay];
        }
        else if (context == _myObserverContextB)
        {//针对UILabel特殊处理。。
            
            UIView *sbvsc = object.myCurrentSizeClass;
           if (sbvsc.widthSizeInner.dimeWrapVal || sbvsc.heightSizeInner.dimeWrapVal)
               [self setNeedsLayout];
        }
    }
}

#pragma mark -- Override Methods

-(void)setWrapContentHeight:(BOOL)wrapContentHeight
{
    MyBaseLayout *lsc = self.myCurrentSizeClass;
    if (lsc.wrapContentHeight != wrapContentHeight)
    {
        lsc.wrapContentHeight = wrapContentHeight;
        [self setNeedsLayout];
    }
}

-(void)setWrapContentWidth:(BOOL)wrapContentWidth
{
    MyBaseLayout *lsc = self.myCurrentSizeClass;
    if (lsc.wrapContentWidth != wrapContentWidth)
    {
        lsc.wrapContentWidth = wrapContentWidth;
        [self setNeedsLayout];
    }
}

-(void)setWrapContentSize:(BOOL)wrapContentSize
{
    MyBaseLayout *lsc = self.myCurrentSizeClass;
    lsc.wrapContentSize = wrapContentSize;
    [self setNeedsLayout];
}

-(CGSize)calcLayoutSize:(CGSize)size isEstimate:(BOOL)isEstimate pHasSubLayout:(BOOL*)pHasSubLayout sizeClass:(MySizeClass)sizeClass sbs:(NSMutableArray*)sbs
{
    CGSize selfSize;
    if (isEstimate)
    {
        selfSize = self.myFrame.frame.size;
    }
    else
    {
        selfSize = self.bounds.size;
        if (size.width != 0)
            selfSize.width = size.width;
        if (size.height != 0)
            selfSize.height = size.height;
    }
    
    if (pHasSubLayout != nil)
        *pHasSubLayout = NO;
    
    return selfSize;
}


-(id)createSizeClassInstance
{
    return [MyLayoutViewSizeClass new];
}


-(CGSize)sizeThatFits:(CGSize)size
{
    return [self sizeThatFits:size inSizeClass:MySizeClass_wAny | MySizeClass_hAny];
}

-(CGSize)sizeThatFits:(CGSize)size inSizeClass:(MySizeClass)sizeClass
{
    return [self myEstimateLayoutSize:size inSizeClass:sizeClass sbs:nil];
}


-(void)setHidden:(BOOL)hidden
{
    if (self.isHidden == hidden)
        return;
    
    [super setHidden:hidden];
    UIView *superview = self.superview;
    if ([superview isKindOfClass:[MyBaseLayout class]])
    {
        if (!((MyBaseLayout*)superview).isMyLayouting)
            [superview setNeedsLayout];
    }
    
    if (hidden == NO)
        [_borderlineLayerDelegate setNeedsLayoutIn:CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height) withLayer:self.layer];
}

-(void)setCenter:(CGPoint)center
{
    CGPoint oldCenter = self.center;
    [super setCenter:center];
    UIView *superview = self.superview;
    if (!CGPointEqualToPoint(oldCenter, center) && [superview isKindOfClass:[MyBaseLayout class]])
    {
        if (!((MyBaseLayout*)superview).isMyLayouting)
            [superview setNeedsLayout];
    }
}

-(void)setFrame:(CGRect)frame
{
    CGRect oldFrame = self.frame;
    [super setFrame:frame];
    UIView *superview = self.superview;
    if (!CGRectEqualToRect(oldFrame, frame) && [superview isKindOfClass:[MyBaseLayout class]])
    {
        if (!((MyBaseLayout*)superview).isMyLayouting)
            [superview setNeedsLayout];
    }
}

- (void)didAddSubview:(UIView *)subview
{
    [super didAddSubview:subview];   //只要加入进来后就修改其默认的实现，而改用我们的实现，这里包括隐藏,调整大小，
    
    if ([subview isKindOfClass:[MyBaseLayout class]])
    {
        ((MyBaseLayout*)subview).cacheEstimatedRect = self.cacheEstimatedRect;
    }
    
    [self myInvalidateIntrinsicContentSize];
}

- (void)willRemoveSubview:(UIView *)subview
{
    [super willRemoveSubview:subview];  //删除后恢复其原来的实现。

    [self myRemoveSubviewObserver:subview];
    
    [self myInvalidateIntrinsicContentSize];
}

-(void)willMoveToWindow:(UIWindow *)newWindow
{
    [super willMoveToWindow:newWindow];
    if (newWindow == nil)
    {
        //这里处理可能因为触摸事件被强行终止而导致的背景色无法恢复的问题。
        [_touchEventDelegate myResetTouchHighlighted2];
    }
}

- (void)willMoveToSuperview:(UIView*)newSuperview
{
    [super willMoveToSuperview:newSuperview];
    
    MyBaseLayout *lsc = self.myCurrentSizeClass;
    
    //特殊处理如果视图是控制器根视图则取消高度或者宽度包裹,以及adjustScrollViewContentSizeMode的设置。
    //但是有一种特殊情况是控制器是子视图控制器。因此还需要添加判断父视图是否是非布局父视图，只有是非布局父视图下才将自适应设置清除
    @try {
        
        if (newSuperview != nil)
        {
            UIRectEdge defRectEdge = UIRectEdgeLeft | UIRectEdgeRight;
            id vc = [self valueForKey:@"viewDelegate"];
            if (vc != nil)
            {
                if (![newSuperview isKindOfClass:[MyBaseLayout class]])
                {
                    if (lsc.widthSizeInner.dimeWrapVal)
                        [lsc.widthSizeInner __equalTo:nil];
                    if (lsc.heightSizeInner.dimeWrapVal)
                        [lsc.heightSizeInner __equalTo:nil];
                }
                
                if (lsc.insetsPaddingFromSafeArea == defRectEdge)
                    lsc.insetsPaddingFromSafeArea = ~UIRectEdgeTop;
                self.adjustScrollViewContentSizeMode = MyAdjustScrollViewContentSizeModeNo;
            }
            
            //如果布局视图的父视图是滚动视图并且是非UITableView和UICollectionView的话。将默认叠加除顶部外的安全区域。
            if ([newSuperview isKindOfClass:[UIScrollView class]] && ![newSuperview isKindOfClass:[UITableView class]] && ![newSuperview isKindOfClass:[UICollectionView class]])
            {
                if (lsc.insetsPaddingFromSafeArea == defRectEdge)
                    lsc.insetsPaddingFromSafeArea = ~UIRectEdgeTop;
            }
        }
        
    } @catch (NSException *exception) {
        
    }
    
    //将要添加到父视图时，如果不是MyLayout派生则则跟需要根据父视图的frame的变化而调整自身的位置和尺寸
    if (newSuperview != nil && ![newSuperview isKindOfClass:[MyBaseLayout class]])
    {

#ifdef DEBUG
        
        if (lsc.leadingPosInner.posRelaVal != nil)
        {
            //约束冲突：左边距依赖的视图不是父视图
            NSCAssert(lsc.leadingPosInner.posRelaVal.view == newSuperview, @"Constraint exception!! %@leading pos dependent on:%@is not superview",self, lsc.leadingPosInner.posRelaVal.view);
        }
        
        if (lsc.trailingPosInner.posRelaVal != nil)
        {
            //约束冲突：右边距依赖的视图不是父视图
            NSCAssert(lsc.trailingPosInner.posRelaVal.view == newSuperview, @"Constraint exception!! %@trailing pos dependent on:%@is not superview",self,lsc.trailingPosInner.posRelaVal.view);
        }
        
        if (lsc.centerXPosInner.posRelaVal != nil)
        {
            //约束冲突：水平中心点依赖的视图不是父视图
            NSCAssert(lsc.centerXPosInner.posRelaVal.view == newSuperview, @"Constraint exception!! %@horizontal center pos dependent on:%@is not superview",self, lsc.centerXPosInner.posRelaVal.view);
        }
        
        if (lsc.topPosInner.posRelaVal != nil)
        {
            //约束冲突：上边距依赖的视图不是父视图
            NSCAssert(lsc.topPosInner.posRelaVal.view == newSuperview, @"Constraint exception!! %@top pos dependent on:%@is not superview",self, lsc.topPosInner.posRelaVal.view);
        }
        
        if (lsc.bottomPosInner.posRelaVal != nil)
        {
            //约束冲突：下边距依赖的视图不是父视图
            NSCAssert(lsc.bottomPosInner.posRelaVal.view == newSuperview, @"Constraint exception!! %@bottom pos dependent on:%@is not superview",self, lsc.bottomPosInner.posRelaVal.view);
        }
        
        if (lsc.centerYPosInner.posRelaVal != nil)
        {
            //约束冲突：垂直中心点依赖的视图不是父视图
            NSCAssert(lsc.centerYPosInner.posRelaVal.view == newSuperview, @"Constraint exception!! vertical center pos dependent on:%@is not superview",lsc.centerYPosInner.posRelaVal.view);
        }
        
        if (lsc.widthSizeInner.dimeRelaVal != nil)
        {
            //约束冲突：宽度依赖的视图不是父视图
            NSCAssert(lsc.widthSizeInner.dimeRelaVal.view == newSuperview, @"Constraint exception!! %@width dependent on:%@is not superview",self, lsc.widthSizeInner.dimeRelaVal.view);
        }
        
        if (lsc.heightSizeInner.dimeRelaVal != nil)
        {
            //约束冲突：高度依赖的视图不是父视图
            NSCAssert(lsc.heightSizeInner.dimeRelaVal.view == newSuperview, @"Constraint exception!! %@height dependent on:%@is not superview",self,lsc.heightSizeInner.dimeRelaVal.view);
        }
        
#endif
        if ([self myUpdateLayoutRectInNoLayoutSuperview:newSuperview])
        {
            //有可能父视图不为空，所以这里先把以前父视图的KVO删除。否则会导致程序崩溃
            
            //如果您在这里出现了崩溃时，不要惊慌，是因为您开启了异常断点调试的原因。这个在release下是不会出现的，要想清除异常断点调试功能，请按下CMD+7键
            //然后在左边将异常断点清除即可
            
            if (_isAddSuperviewKVO && self.superview != nil && ![self.superview isKindOfClass:[MyBaseLayout class]])
            {
                @try {
                    [self.superview removeObserver:self forKeyPath:@"frame"];
                }
                @catch (NSException *exception) {
                }
                @finally {
                }
                
                @try {
                    [self.superview removeObserver:self forKeyPath:@"bounds"];
                }
                @catch (NSException *exception) {
                }
                @finally {
                }
            }
            
            [newSuperview addObserver:self forKeyPath:@"frame" options:NSKeyValueObservingOptionOld | NSKeyValueObservingOptionNew context:_myObserverContextC];
            [newSuperview addObserver:self forKeyPath:@"bounds" options:NSKeyValueObservingOptionOld | NSKeyValueObservingOptionNew context:_myObserverContextC];
            _isAddSuperviewKVO = YES;
        }
    }
         
    if (_isAddSuperviewKVO && newSuperview == nil && self.superview != nil && ![self.superview isKindOfClass:[MyBaseLayout class]])
    {
        //如果您在这里出现了崩溃时，不要惊慌，是因为您开启了异常断点调试的原因。这个在release下是不会出现的，要想清除异常断点调试功能，请按下CMD+7键
        //然后在左边将异常断点清除即可
        _isAddSuperviewKVO = NO;
        @try {
            [self.superview removeObserver:self forKeyPath:@"frame"];
            
        }
        @catch (NSException *exception) {
        }
        @finally {
        }
        
        @try {
            [self.superview removeObserver:self forKeyPath:@"bounds"];
        }
        @catch (NSException *exception) {
        }
        @finally {
        }
    }
    
    if (newSuperview != nil)
    {
        //不支持放在UITableView和UICollectionView下,因为有肯能是tableheaderView或者section下。
        if ([newSuperview isKindOfClass:[UIScrollView class]] && ![newSuperview isKindOfClass:[UITableView class]] && ![newSuperview isKindOfClass:[UICollectionView class]])
        {
            if (self.adjustScrollViewContentSizeMode == MyAdjustScrollViewContentSizeModeAuto)
            {
                //这里预先设置一下contentSize主要是为了解决contentOffset在后续计算contentSize的偏移错误的问题。
                [UIView performWithoutAnimation:^{
                    UIScrollView *scrollSuperView = (UIScrollView*)newSuperview;
                    if (CGSizeEqualToSize(scrollSuperView.contentSize, CGSizeZero))
                    {
                        CGSize screenSize = [UIScreen mainScreen].bounds.size;
                        scrollSuperView.contentSize =  CGSizeMake(0, screenSize.height + 0.1);
                    }
                }];
             
                self.adjustScrollViewContentSizeMode = MyAdjustScrollViewContentSizeModeYes;
            }
        }
    }
    else
    {
        _optionalData.aniDuration = 0.0;
        _optionalData.beginLayoutBlock = nil;
        _optionalData.endLayoutBlock = nil;
        if (_optionalData.rotationToDeviceOrientationBlock == nil)
            _optionalData = nil;
    }
}

-(void)awakeFromNib
{
    [super awakeFromNib];
    
    if (self.superview != nil && ![self.superview isKindOfClass:[MyBaseLayout class]])
        [self myUpdateLayoutRectInNoLayoutSuperview:self.superview];
}

-(void)safeAreaInsetsDidChange
{
#if (__IPHONE_OS_VERSION_MAX_ALLOWED >= 110000) || (__TV_OS_VERSION_MAX_ALLOWED >= 110000)

    [super safeAreaInsetsDidChange];
#endif
    
    if (self.superview != nil && ![self.superview isKindOfClass:[MyBaseLayout class]] &&
        (self.leadingPosInner.isSafeAreaPos ||
         self.trailingPosInner.isSafeAreaPos ||
         self.topPosInner.isSafeAreaPos ||
         self.bottomPosInner.isSafeAreaPos)
        )
    {
        if (!_isMyLayouting)
        {
            _isMyLayouting = YES;
            [self myUpdateLayoutRectInNoLayoutSuperview:self.superview];
            _isMyLayouting = NO;
        }
    }
}

-(void)setNeedsLayout
{
    [super setNeedsLayout];
    [self myInvalidateIntrinsicContentSize];
}

-(CGSize)intrinsicContentSize
{
    CGSize sz = [super intrinsicContentSize];
    if (self.translatesAutoresizingMaskIntoConstraints == NO && (self.widthSizeInner.dimeWrapVal || self.heightSizeInner.dimeWrapVal))
    {
        if (self.widthSizeInner.dimeWrapVal && self.heightSizeInner.dimeWrapVal)
        {
            sz = [self sizeThatFits:CGSizeZero];
        }
        else if (self.widthSizeInner.dimeWrapVal)
        {
            //动态宽度
            NSLayoutConstraint *heightConstraint = nil;
            for (NSLayoutConstraint *constraint in self.constraints)
            {
                if (constraint.firstItem == self && constraint.firstAttribute == NSLayoutAttributeHeight)
                {
                    heightConstraint = constraint;
                    break;
                }
            }
            
            if (heightConstraint == nil)
            {
                for (NSLayoutConstraint *constraint in self.superview.constraints)
                {
                    if (constraint.firstItem == self && constraint.firstAttribute == NSLayoutAttributeHeight)
                    {
                        heightConstraint = constraint;
                        break;
                    }
                }
            }
            
            if (heightConstraint != nil)
            {
                CGFloat dependHeight = UIViewNoIntrinsicMetric;
                if ([heightConstraint.secondItem isKindOfClass:[UIView class]])
                {
                    UIView *dependView = (UIView*)heightConstraint.secondItem;
                    CGRect dependViewRect = dependView.bounds;
                    if (heightConstraint.secondAttribute == NSLayoutAttributeHeight)
                        dependHeight = CGRectGetHeight(dependViewRect);
                    else if (heightConstraint.secondAttribute == NSLayoutAttributeWidth)
                        dependHeight = CGRectGetWidth(dependViewRect);
                    else
                        dependHeight = UIViewNoIntrinsicMetric;
                }
                else if (heightConstraint.secondItem == nil)
                {
                    dependHeight = 0;
                }
                else
                {
                    //do nothing...
                }
                
                if (dependHeight != UIViewNoIntrinsicMetric)
                {
                    dependHeight *= heightConstraint.multiplier;
                    dependHeight += heightConstraint.constant;
                    
                    sz.width = [self sizeThatFits:CGSizeMake(0, dependHeight)].width;
                }
            }
        }
        else
        {
            //动态高度
            NSLayoutConstraint *widthConstraint = nil;
            for (NSLayoutConstraint *constraint in self.constraints)
            {
                if (constraint.firstItem == self && constraint.firstAttribute == NSLayoutAttributeWidth)
                {
                    widthConstraint = constraint;
                    break;
                }
            }
            
            if (widthConstraint == nil)
            {
                for (NSLayoutConstraint *constraint in self.superview.constraints)
                {
                    if (constraint.firstItem == self && constraint.firstAttribute == NSLayoutAttributeWidth)
                    {
                        widthConstraint = constraint;
                        break;
                    }
                }
            }
            
            CGFloat dependWidth = UIViewNoIntrinsicMetric;
            if (widthConstraint != nil)
            {
                if ([widthConstraint.secondItem isKindOfClass:[UIView class]])
                {
                    UIView *dependView = (UIView*)widthConstraint.secondItem;
                    CGRect dependViewRect = dependView.bounds;
                    if (widthConstraint.secondAttribute == NSLayoutAttributeWidth)
                        dependWidth = CGRectGetWidth(dependViewRect);
                    else if (widthConstraint.secondAttribute == NSLayoutAttributeHeight)
                        dependWidth = CGRectGetHeight(dependViewRect);
                    else
                        dependWidth = UIViewNoIntrinsicMetric;
                }
                else if (widthConstraint.secondItem == nil)
                {
                    dependWidth = 0;
                }
                else
                {
                    //do nothing...
                }
                
                if (dependWidth != UIViewNoIntrinsicMetric)
                {
                    dependWidth *= widthConstraint.multiplier;
                    dependWidth += widthConstraint.constant;
                    sz.height = [self sizeThatFits:CGSizeMake(dependWidth, 0)].height;
                }
            }
        }
    }
    
    return sz;
}


-(void)doLayoutSubviews
{
    int  currentScreenOrientation = 0;
    
    if (!self.isMyLayouting)
    {
        self.isMyLayouting = YES;
        
        if (self.priorAutoresizingMask)
            [super layoutSubviews];
        
        //减少每次调用就计算设备方向以及sizeclass的次数。
        MySizeClass sizeClass = [self myGetGlobalSizeClass];
        if ((sizeClass & 0xF0) == MySizeClass_Portrait)
            currentScreenOrientation = 1;
        else if ((sizeClass & 0xF0) == MySizeClass_Landscape)
            currentScreenOrientation = 2;
        
        MyFrame *selfMyFrame = self.myFrame;
        if (selfMyFrame.multiple)
            selfMyFrame.sizeClass = [self myBestSizeClass:sizeClass myFrame:selfMyFrame];
        for (UIView *sbv in self.subviews)
        {
            MyFrame *sbvmyFrame = sbv.myFrame;
            if (sbvmyFrame.multiple)
                sbv.myFrame.sizeClass = [sbv myBestSizeClass:sizeClass myFrame:sbvmyFrame];
            
            if (!sbvmyFrame.hasObserver && sbvmyFrame.sizeClass != nil && !sbvmyFrame.sizeClass.useFrame)
                [self myAddSubviewObserver:sbv sbvmyFrame:sbvmyFrame];
        }
        
        MyBaseLayout *lsc = (MyBaseLayout*)selfMyFrame.sizeClass;
        
        //计算布局
        CGSize oldSelfSize = self.bounds.size;
        CGSize newSelfSize;
        if (_useCacheRects && selfMyFrame.width != CGFLOAT_MAX && selfMyFrame.height != CGFLOAT_MAX)
            newSelfSize = CGSizeMake(selfMyFrame.width, selfMyFrame.height);
        else
            newSelfSize = [self calcLayoutSize:[self myCalcSizeInNoLayoutSuperview:self.superview currentSize:oldSelfSize] isEstimate:NO pHasSubLayout:nil sizeClass:sizeClass sbs:nil];
        
        newSelfSize = _myCGSizeRound(newSelfSize);
        _useCacheRects = NO;
        
        static CGFloat sSizeError = 0;
        if (sSizeError == 0)
            sSizeError = 1 / [UIScreen mainScreen].scale + 0.0001;  //误差量。
        
        //设置子视图的frame并还原
        for (UIView *sbv in self.subviews)
        {
            CGRect sbvOldBounds = sbv.bounds;
            CGPoint sbvOldCenter = sbv.center;
            
            MyFrame *sbvmyFrame = sbv.myFrame;
            MyViewSizeClass *sbvsc = (MyViewSizeClass*)[sbv myCurrentSizeClassFrom:sbvmyFrame];
            
            if (sbvmyFrame.leading != CGFLOAT_MAX && sbvmyFrame.top != CGFLOAT_MAX && !sbvsc.noLayout && !sbvsc.useFrame)
            {
                if (sbvmyFrame.width < 0)
                    sbvmyFrame.width = 0;
                if (sbvmyFrame.height < 0)
                    sbvmyFrame.height = 0;
                
                //这里的位置需要进行有效像素的舍入处理，否则可能出现文本框模糊，以及视图显示可能多出一条黑线的问题。
                //原因是当frame中的值不能有效的转化为最小可绘制的物理像素时就会出现模糊，虚化，多出黑线，以及layer处理圆角不圆的情况。
                //所以这里要将frame中的点转化为有效的点。
                //这里之所以将布局子视图的转化方法和一般子视图的转化方法区分开来是因为我们要保证布局子视图不能出现细微的重叠，因为布局子视图有边界线
                //如果有边界线而又出现细微重叠的话，那么边界线将无法正常显示，因此这里做了一个特殊的处理。
                CGRect rc;
                if ([sbv isKindOfClass:[MyBaseLayout class]])
                {
                    rc  = _myLayoutCGRectRound(sbvmyFrame.frame);
                    
                    CGRect sbvTempBounds = CGRectMake(sbvOldBounds.origin.x, sbvOldBounds.origin.y, rc.size.width, rc.size.height);
                    
                    if (_myCGFloatErrorEqual(sbvTempBounds.size.width, sbvOldBounds.size.width, sSizeError))
                        sbvTempBounds.size.width = sbvOldBounds.size.width;
                    
                    if (_myCGFloatErrorEqual(sbvTempBounds.size.height, sbvOldBounds.size.height, sSizeError))
                        sbvTempBounds.size.height = sbvOldBounds.size.height;
                    
                    if (_myCGFloatErrorNotEqual(sbvTempBounds.size.width, sbvOldBounds.size.width, sSizeError)||
                        _myCGFloatErrorNotEqual(sbvTempBounds.size.height, sbvOldBounds.size.height, sSizeError))
                        sbv.bounds = sbvTempBounds;
                    
                    CGPoint sbvTempCenter = CGPointMake(rc.origin.x + sbv.layer.anchorPoint.x * sbvTempBounds.size.width, rc.origin.y + sbv.layer.anchorPoint.y * sbvTempBounds.size.height);
                    
                    if (_myCGFloatErrorEqual(sbvTempCenter.x, sbvOldCenter.x, sSizeError))
                        sbvTempCenter.x = sbvOldCenter.x;
                    
                    if (_myCGFloatErrorEqual(sbvTempCenter.y, sbvOldCenter.y, sSizeError))
                        sbvTempCenter.y = sbvOldCenter.y;
                    
                    if (_myCGFloatErrorNotEqual(sbvTempCenter.x, sbvOldCenter.x, sSizeError)||
                        _myCGFloatErrorNotEqual(sbvTempCenter.y, sbvOldCenter.y, sSizeError))
                        sbv.center = sbvTempCenter;
                }
                else
                {
                    rc = _myCGRectRound(sbvmyFrame.frame);
                    sbv.center = CGPointMake(rc.origin.x + sbv.layer.anchorPoint.x * rc.size.width, rc.origin.y + sbv.layer.anchorPoint.y * rc.size.height);
                    sbv.bounds = CGRectMake(sbvOldBounds.origin.x, sbvOldBounds.origin.y, rc.size.width, rc.size.height);
                }
            }
            
            if (sbvsc.visibility == MyVisibility_Gone && !sbv.isHidden)
                sbv.bounds = CGRectMake(sbvOldBounds.origin.x, sbvOldBounds.origin.y, 0, 0);
            
            if (sbvmyFrame.sizeClass.viewLayoutCompleteBlock != nil)
            {
                sbvmyFrame.sizeClass.viewLayoutCompleteBlock(self, sbv);
                sbvmyFrame.sizeClass.viewLayoutCompleteBlock = nil;
            }
            
            if (sbvmyFrame.multiple)
                sbvmyFrame.sizeClass = [sbv myDefaultSizeClass];
            
            [sbvmyFrame reset];
        }
        
        if (newSelfSize.width != CGFLOAT_MAX && (lsc.widthSizeInner.dimeWrapVal || lsc.heightSizeInner.dimeWrapVal))
        {
            //因为布局子视图的新老尺寸计算在上面有两种不同的方法，因此这里需要考虑两种计算的误差值，而这两种计算的误差值是不超过1/屏幕精度的。
            //因此我们认为当二者的值超过误差时我们才认为有尺寸变化。
            BOOL isWidthAlter =  _myCGFloatErrorNotEqual(newSelfSize.width, oldSelfSize.width, sSizeError);
            BOOL isHeightAlter = _myCGFloatErrorNotEqual(newSelfSize.height, oldSelfSize.height, sSizeError);
            
            //如果父视图也是布局视图，并且自己隐藏则不调整自身的尺寸和位置。
            BOOL isAdjustSelf = YES;
            if (self.superview != nil && [self.superview isKindOfClass:[MyBaseLayout class]])
            {
                MyBaseLayout *supl = (MyBaseLayout*)self.superview;
                if ([supl myIsNoLayoutSubview:self])
                    isAdjustSelf = NO;
            }
            if (isAdjustSelf && (isWidthAlter || isHeightAlter))
            {
                if (newSelfSize.width < 0)
                    newSelfSize.width = 0;
                
                if (newSelfSize.height < 0)
                    newSelfSize.height = 0;
                
                if (CGAffineTransformIsIdentity(self.transform))
                {
                    CGRect currentFrame = self.frame;
                    if (isWidthAlter && lsc.widthSizeInner.dimeWrapVal)
                        currentFrame.size.width = newSelfSize.width;
                    
                    if (isHeightAlter && lsc.heightSizeInner.dimeWrapVal)
                        currentFrame.size.height = newSelfSize.height;
                    
                    self.frame = currentFrame;
                }
                else
                {
                    CGRect currentBounds = self.bounds;
                    CGPoint currentCenter = self.center;
                    
                    //针对滚动父视图做特殊处理，如果父视图是滚动视图，而且当前的缩放比例不为1时系统会调整中心点的位置，因此这里需要特殊处理。
                    CGFloat superViewZoomScale = 1.0;
                    if ([self.superview isKindOfClass:[UIScrollView class]])
                        superViewZoomScale = ((UIScrollView*)self.superview).zoomScale;
                    
                    if (isWidthAlter && lsc.widthSizeInner.dimeWrapVal)
                    {
                        currentBounds.size.width = newSelfSize.width;
                        currentCenter.x += (newSelfSize.width - oldSelfSize.width) * self.layer.anchorPoint.x * superViewZoomScale;
                    }
                    
                    if (isHeightAlter && lsc.heightSizeInner.dimeWrapVal)
                    {
                        currentBounds.size.height = newSelfSize.height;
                        currentCenter.y += (newSelfSize.height - oldSelfSize.height) * self.layer.anchorPoint.y * superViewZoomScale;
                    }
                    
                    self.bounds = currentBounds;
                    self.center = currentCenter;
                }
            }
        }
        
        //这里只用width判断的原因是如果newSelfSize被计算成功则size中的所有值都不是CGFLOAT_MAX，所以这里选width只是其中一个代表。
        if (newSelfSize.width != CGFLOAT_MAX)
        {
            UIView *supv = self.superview;
            //更新边界线。
            if (_borderlineLayerDelegate != nil)
            {
                CGRect borderlineRect = CGRectMake(0, 0, newSelfSize.width, newSelfSize.height);
                if ([supv isKindOfClass:[MyBaseLayout class]])
                {
                    //这里给父布局视图一个机会来可以改变当前布局的borderlineRect的值，也就是显示的边界线有可能会超出当前布局视图本身的区域。
                    //比如一些表格或者其他的情况。默认情况下这个函数什么也不做。
                    [((MyBaseLayout*)supv) myHookSublayout:self borderlineRect:&borderlineRect];
                }
                
                [_borderlineLayerDelegate setNeedsLayoutIn:borderlineRect withLayer:self.layer];
                
            }
            //如果自己的父视图是非UIScrollView以及非布局视图。以及自己的宽度或者高度是包裹的，并且如果设置了在父视图居中或者居下或者居右时要在父视图中更新自己的位置。
            if (supv != nil && ![supv isKindOfClass:[MyBaseLayout class]])
            {
                CGPoint centerPonintSelf = self.center;
                CGRect rectSelf = self.bounds;
                CGRect rectSuper = supv.bounds;
                
                //特殊处理低版本下的top和bottom的两种安全区域的场景。
                if ((lsc.topPosInner.isSafeAreaPos || lsc.bottomPosInner.isSafeAreaPos) && [UIDevice currentDevice].systemVersion.doubleValue < 11 )
                {
                    if (lsc.topPosInner.isSafeAreaPos)
                        centerPonintSelf.y = [lsc.topPosInner realPosIn:rectSuper.size.height] + self.layer.anchorPoint.y * rectSelf.size.height;
                    else
                        centerPonintSelf.y  = rectSuper.size.height - rectSelf.size.height - [lsc.bottomPosInner realPosIn:rectSuper.size.height] + self.layer.anchorPoint.y * rectSelf.size.height;
                }
                
                //如果自己的父视图是非UIScrollView以及非布局视图。以及自己的宽度或者高度是包裹的时，并且如果设置了在父视图居中或者居下或者居右时要在父视图中更新自己的位置。
                if (![supv isKindOfClass:[UIScrollView class]] && (lsc.widthSizeInner.dimeWrapVal || lsc.heightSizeInner.dimeWrapVal))
                {
                    
                    if ([MyBaseLayout isRTL])
                        centerPonintSelf.x = rectSuper.size.width - centerPonintSelf.x;
                    
                    if (lsc.widthSizeInner.dimeWrapVal)
                    {
                        //如果只设置了右边，或者只设置了居中则更新位置。。
                        if (lsc.centerXPosInner.posVal != nil)
                        {
                            centerPonintSelf.x = (rectSuper.size.width - rectSelf.size.width)/2 + self.layer.anchorPoint.x * rectSelf.size.width;
                            
                            centerPonintSelf.x += [lsc.centerXPosInner realPosIn:rectSuper.size.width];
                        }
                        else if (lsc.trailingPosInner.posVal != nil && lsc.leadingPosInner.posVal == nil)
                        {
                            centerPonintSelf.x  = rectSuper.size.width - rectSelf.size.width - [lsc.trailingPosInner realPosIn:rectSuper.size.width] + self.layer.anchorPoint.x * rectSelf.size.width;
                        }
                    }
                    
                    if (lsc.heightSizeInner.dimeWrapVal)
                    {
                        if (lsc.centerYPosInner.posVal != nil)
                        {
                            centerPonintSelf.y = (rectSuper.size.height - rectSelf.size.height)/2 + [lsc.centerYPosInner realPosIn:rectSuper.size.height] + self.layer.anchorPoint.y * rectSelf.size.height;
                        }
                        else if (lsc.bottomPosInner.posVal != nil && lsc.topPosInner.posVal == nil)
                        {
                            //这里可能有坑，在有安全区时。但是先不处理了。
                            centerPonintSelf.y  = rectSuper.size.height - rectSelf.size.height - [lsc.bottomPosInner realPosIn:rectSuper.size.height] + self.layer.anchorPoint.y * rectSelf.size.height;
                        }
                    }
                    
                    if ([MyBaseLayout isRTL])
                        centerPonintSelf.x = rectSuper.size.width - centerPonintSelf.x;
                }
                
                //如果有变化则只调整自己的center。而不变化
                if (!_myCGPointEqual(self.center, centerPonintSelf))
                    self.center = centerPonintSelf;
            }
            
            //这里处理当布局视图的父视图是非布局父视图，且父视图具有wrap属性时需要调整父视图的尺寸。
            if (supv != nil && ![supv isKindOfClass:[MyBaseLayout class]])
            {
                if (supv.heightSizeInner.dimeWrapVal || supv.widthSizeInner.dimeWrapVal)
                {
                    //调整父视图的高度和宽度。frame值。
                    CGRect superBounds = supv.bounds;
                    CGPoint superCenter = supv.center;
                    
                    if (supv.heightSizeInner.dimeWrapVal)
                    {
                        superBounds.size.height = [self myValidMeasure:supv.heightSizeInner sbv:supv calcSize:lsc.myTop + newSelfSize.height + lsc.myBottom sbvSize:superBounds.size selfLayoutSize:newSelfSize];
                        superCenter.y += (superBounds.size.height - supv.bounds.size.height) * supv.layer.anchorPoint.y;
                    }
                    
                    if (supv.widthSizeInner.dimeWrapVal)
                    {
                        superBounds.size.width = [self myValidMeasure:supv.widthSizeInner sbv:supv calcSize:lsc.myLeading + newSelfSize.width + lsc.myTrailing sbvSize:superBounds.size selfLayoutSize:newSelfSize];
                        superCenter.x += (superBounds.size.width - supv.bounds.size.width) * supv.layer.anchorPoint.x;
                    }
                    
                    if (!_myCGRectEqual(supv.bounds, superBounds))
                    {
                        supv.center = superCenter;
                        supv.bounds = superBounds;
                    }
                }
            }
            
            //处理父视图是滚动视图时动态调整滚动视图的contentSize
            [self myLayout:lsc adjustScrollViewContentWithSize:newSelfSize];
        }
        
        if (selfMyFrame.multiple)
            selfMyFrame.sizeClass = [self myDefaultSizeClass];
        self.isMyLayouting = NO;
    }
    
    //执行屏幕旋转的处理逻辑。
    if (currentScreenOrientation != 0 && _optionalData.rotationToDeviceOrientationBlock != nil)
    {
        if (_optionalData.lastScreenOrientation == 0)
        {
            _optionalData.lastScreenOrientation = currentScreenOrientation;
            _optionalData.rotationToDeviceOrientationBlock(self,YES, currentScreenOrientation == 1);
        }
        else
        {
            if (_optionalData.lastScreenOrientation != currentScreenOrientation)
            {
                _optionalData.lastScreenOrientation = currentScreenOrientation;
                _optionalData.rotationToDeviceOrientationBlock(self, NO, currentScreenOrientation == 1);
            }
        }
        
        _optionalData.lastScreenOrientation = currentScreenOrientation;
    }
}

-(void)layoutSubviews
{
    if (!self.autoresizesSubviews)
        return;
    
    if (_optionalData.beginLayoutBlock != nil)
    {
        _optionalData.beginLayoutBlock();
        _optionalData.beginLayoutBlock = nil;
    }
    
    if (_optionalData == nil || _optionalData.aniDuration <= 0)
    {
        [self doLayoutSubviews];
    }
    else
    {
        [UIView animateWithDuration:_optionalData.aniDuration delay:0 options:_optionalData.aniOptions animations:^{
            [self doLayoutSubviews];
        } completion:_optionalData.aniCompletion];
        
        _optionalData.aniDuration = 0.0;
        _optionalData.aniCompletion = nil;
    }
    
    if (_optionalData.endLayoutBlock != nil)
    {
        _optionalData.endLayoutBlock();
        _optionalData.endLayoutBlock = nil;
    }

    //因为rotationToDeviceOrientationBlock设置后不会在内部被清除，而其他的都会被清除。
    //所有只要rotationToDeviceOrientationBlock为空就可以将可选的多余数据给清除掉了。
    if (_optionalData != nil && _optionalData.rotationToDeviceOrientationBlock == nil)
        _optionalData = nil;
}

-(void)traitCollectionDidChange:(UITraitCollection *)previousTraitCollection
{
    [super traitCollectionDidChange:previousTraitCollection];
    if (@available(iOS 12.0, *)) {
        if (self.traitCollection.userInterfaceStyle != previousTraitCollection.userInterfaceStyle)
        {
            [_borderlineLayerDelegate updateAllBorderlineColor];
        }
    } else {
        // Fallback on earlier versions
    }
}

#pragma mark -- Private Methods

-(CGSize)myEstimateLayoutSize:(CGSize)size inSizeClass:(MySizeClass)sizeClass sbs:(NSMutableArray*)sbs
{
    MyFrame *selfMyFrame = self.myFrame;
    
    if (selfMyFrame.multiple)
        selfMyFrame.sizeClass = [self myBestSizeClass:sizeClass myFrame:selfMyFrame];
    
    for (UIView *sbv in self.subviews)
    {
        MyFrame *sbvmyFrame = sbv.myFrame;
        if (sbvmyFrame.multiple)
            sbvmyFrame.sizeClass = [sbv myBestSizeClass:sizeClass myFrame:sbvmyFrame];
    }
    
    //因为子布局会调用layoutSubviews来进行自身的布局，所以在非评估模式下对于尺寸自适应的子布局不应该调用sizeThatFit方法来获取尺寸。
    BOOL hasWrapSizeSubLayout = NO;
    CGSize selfSize= [self calcLayoutSize:size isEstimate:NO pHasSubLayout:&hasWrapSizeSubLayout sizeClass:sizeClass sbs:sbs];
    
    if (hasWrapSizeSubLayout)
    {
        selfMyFrame.width = selfSize.width;
        selfMyFrame.height = selfSize.height;
        
        if (selfMyFrame.sizeClass.widthSizeInner.dimeWrapVal)
            selfSize.width = 0;
        if (selfMyFrame.sizeClass.heightSizeInner.dimeWrapVal)
            selfSize.height = 0;
        
        selfSize = [self calcLayoutSize:selfSize isEstimate:YES pHasSubLayout:&hasWrapSizeSubLayout sizeClass:sizeClass sbs:sbs];
    }
    
    selfMyFrame.width = selfSize.width;
    selfMyFrame.height = selfSize.height;
    
    //计算后还原为默认sizeClass
    for (UIView *sbv in self.subviews)
    {
        MyFrame *sbvmyFrame = sbv.myFrame;
        if (sbvmyFrame.multiple)
            sbvmyFrame.sizeClass = self.myDefaultSizeClass;
    }
    
    if (selfMyFrame.multiple)
        selfMyFrame.sizeClass = self.myDefaultSizeClass;
    
    if (self.cacheEstimatedRect)
        _useCacheRects = YES;
    
    return CGSizeMake(_myCGFloatRound(selfSize.width), _myCGFloatRound(selfSize.height));
}

-(BOOL)myIsRelativePos:(CGFloat)margin
{
    return margin > 0 && margin < 1;
}

-(MyGravity)myGetSubview:(MyViewSizeClass*)sbvsc vertGravity:(MyGravity)vertGravity
{
    MyGravity sbvVertAligement = sbvsc.alignment & MyGravity_Horz_Mask;
    MyGravity sbvVertGravity = MyGravity_Vert_Top;
    
    if (vertGravity != MyGravity_None)
    {
        sbvVertGravity = vertGravity;
        if (sbvVertAligement != MyGravity_None)
            sbvVertGravity = sbvVertAligement;
    }
    else
    {
        if (sbvVertAligement != MyGravity_None)
            sbvVertGravity = sbvVertAligement;
        
        if (sbvsc.topPosInner.posVal != nil && sbvsc.bottomPosInner.posVal != nil)
        {
            //只有在没有设置高度约束，或者高度约束优先级很低的情况下同时设置上下才转化为填充。
            if (sbvsc.heightSizeInner.dimeVal == nil || sbvsc.heightSizeInner.priority == MyPriority_Low)
                sbvVertGravity = MyGravity_Vert_Fill;
        }
        else if (sbvsc.centerYPosInner.posVal != nil)
        {
            sbvVertGravity = MyGravity_Vert_Center;
        }
        else if (sbvsc.topPosInner.posVal != nil)
        {
            sbvVertGravity = MyGravity_Vert_Top;
        }
        else if (sbvsc.bottomPosInner.posVal != nil)
        {
            sbvVertGravity = MyGravity_Vert_Bottom;
        }
    }
    
    return sbvVertGravity;
}


-(CGFloat)myCalcSubview:(MyViewSizeClass*)sbvsc
            vertGravity:(MyGravity)vertGravity
             paddingTop:(CGFloat)paddingTop
          paddingBottom:(CGFloat)paddingBottom
            baselinePos:(CGFloat)baselinePos
               selfSize:(CGSize)selfSize
                  pRect:(CGRect*)pRect
{
    UIView *sbv = sbvsc.view;
    
   CGFloat  topMargin =  [self myValidMargin:sbvsc.topPosInner sbv:sbv calcPos:[sbvsc.topPosInner realPosIn:selfSize.height - paddingTop - paddingBottom] selfLayoutSize:selfSize];
    
   CGFloat  centerMargin = [self myValidMargin:sbvsc.centerYPosInner sbv:sbv calcPos:[sbvsc.centerYPosInner realPosIn:selfSize.height - paddingTop - paddingBottom] selfLayoutSize:selfSize];
    
   CGFloat  bottomMargin = [self myValidMargin:sbvsc.bottomPosInner sbv:sbv calcPos:[sbvsc.bottomPosInner realPosIn:selfSize.height - paddingTop - paddingBottom] selfLayoutSize:selfSize];

    //垂直压缩。
    CGFloat fixedHeight = topMargin + centerMargin + bottomMargin + pRect->size.height;
    if (fixedHeight > selfSize.height)
    {
        CGFloat floatingHeight = selfSize.height - fixedHeight;
        CGFloat totalShrink = sbvsc.topPosInner.shrink + sbvsc.centerYPosInner.shrink + sbvsc.bottomPosInner.shrink + sbvsc.heightSizeInner.shrink;
        if (totalShrink != 0.0)
        {
            topMargin += (sbvsc.topPosInner.shrink / totalShrink) * floatingHeight;
            centerMargin += (sbvsc.centerYPosInner.shrink / totalShrink) * floatingHeight;
            bottomMargin += (sbvsc.bottomPosInner.shrink / totalShrink) * floatingHeight;
            pRect->size.height += (sbvsc.heightSizeInner.shrink / totalShrink) * floatingHeight;
        }
    }
    
    //如果是设置垂直拉伸则，如果子视图有约束则不受影响，否则就变为和填充一个意思。
    if (vertGravity == MyGravity_Vert_Stretch)
    {
        if (sbvsc.heightSizeInner.dimeVal != nil && sbvsc.heightSizeInner.priority != MyPriority_Low)
            vertGravity = MyGravity_Vert_Top;
        else
            vertGravity = MyGravity_Vert_Fill;
    }
    
    //确保设置基线对齐的视图都是UILabel,UITextField,UITextView
    if (baselinePos == CGFLOAT_MAX && vertGravity == MyGravity_Vert_Baseline)
        vertGravity = MyGravity_Vert_Top;
    
    UIFont *sbvFont = nil;
    if (vertGravity == MyGravity_Vert_Baseline)
        sbvFont = [self myGetSubviewFont:sbv];
    
    if (sbvFont == nil && vertGravity == MyGravity_Vert_Baseline)
        vertGravity = MyGravity_Vert_Top;
    
    if (vertGravity == MyGravity_Vert_Top)
    {
        pRect->origin.y = paddingTop + topMargin;
    }
    else if (vertGravity == MyGravity_Vert_Bottom)
    {
        pRect->origin.y = selfSize.height - paddingBottom - bottomMargin - pRect->size.height;
    }
    else if (vertGravity == MyGravity_Vert_Baseline)
    {
        //得到基线位置。
        pRect->origin.y = baselinePos - sbvFont.ascender - (pRect->size.height - sbvFont.lineHeight) / 2;

    }
    else if (vertGravity == MyGravity_Vert_Fill)
    {
        pRect->origin.y = paddingTop + topMargin;
        pRect->size.height = [self myValidMeasure:sbvsc.heightSizeInner sbv:sbv calcSize:selfSize.height - paddingTop - paddingBottom - topMargin - bottomMargin  sbvSize:pRect->size selfLayoutSize:selfSize];
    }
    else if (vertGravity == MyGravity_Vert_Center)
    {
        pRect->origin.y = (selfSize.height - paddingTop - paddingBottom - topMargin - bottomMargin - pRect->size.height)/2 + paddingTop + topMargin + centerMargin;
    }
    else if (vertGravity == MyGravity_Vert_Window_Center)
    {
        if (self.window != nil)
        {
            pRect->origin.y = (CGRectGetHeight(self.window.bounds) - topMargin - bottomMargin - pRect->size.height)/2 + topMargin + centerMargin;
            pRect->origin.y =  [self.window convertPoint:pRect->origin toView:self].y;
        }
    }
    else
    {
        ;
    }
    
    return topMargin + centerMargin + bottomMargin + pRect->size.height;
}


-(MyGravity)myGetSubview:(MyViewSizeClass*)sbvsc horzGravity:(MyGravity)horzGravity
{
    MyGravity sbvHorzAligement = [self myConvertLeftRightGravityToLeadingTrailing:sbvsc.alignment & MyGravity_Vert_Mask];
    MyGravity sbvHorzGravity = MyGravity_Horz_Leading;
    
    if (horzGravity != MyGravity_None)
    {
        sbvHorzGravity = horzGravity;
        if (sbvHorzAligement != MyGravity_None)
            sbvHorzGravity = sbvHorzAligement;
    }
    else
    {
        if (sbvHorzAligement != MyGravity_None)
            sbvHorzGravity = sbvHorzAligement;
        
        if (sbvsc.leadingPosInner.posVal != nil && sbvsc.trailingPosInner.posVal != nil)
        {
            //只有在没有设置宽度约束，或者宽度约束优先级很低的情况下同时设置左右才转化为填充。
            if (sbvsc.widthSizeInner.dimeVal == nil || sbvsc.widthSizeInner.priority == MyPriority_Low)
                sbvHorzGravity = MyGravity_Horz_Fill;
        }
        else if (sbvsc.centerXPosInner.posVal != nil)
        {
            sbvHorzGravity = MyGravity_Horz_Center;
        }
        else if (sbvsc.leadingPosInner.posVal != nil)
        {
            sbvHorzGravity = MyGravity_Horz_Leading;
        }
        else if (sbvsc.trailingPosInner.posVal != nil)
        {
            sbvHorzGravity = MyGravity_Horz_Trailing;
        }
    }
    
    return sbvHorzGravity;
}

-(CGFloat)myCalcSubview:(MyViewSizeClass*)sbvsc
            horzGravity:(MyGravity)horzGravity
         paddingLeading:(CGFloat)paddingLeading
        paddingTrailing:(CGFloat)paddingTrailing
               selfSize:(CGSize)selfSize
                  pRect:(CGRect*)pRect
{
    UIView *sbv = sbvsc.view;
    CGFloat paddingHorz = paddingLeading + paddingTrailing;
    
    CGFloat leadingMargin = [self myValidMargin:sbvsc.leadingPosInner sbv:sbv calcPos:[sbvsc.leadingPosInner realPosIn:selfSize.width - paddingHorz] selfLayoutSize:selfSize];
    
    CGFloat centerMargin = [self myValidMargin:sbvsc.centerXPosInner sbv:sbv calcPos:[sbvsc.centerXPosInner realPosIn:selfSize.width - paddingHorz] selfLayoutSize:selfSize];
    
   CGFloat  trailingMargin = [self myValidMargin:sbvsc.trailingPosInner sbv:sbv calcPos:[sbvsc.trailingPosInner realPosIn:selfSize.width - paddingHorz] selfLayoutSize:selfSize];

    //水平压缩。
    CGFloat fixedWidth = leadingMargin + centerMargin + trailingMargin + pRect->size.width;
    if (fixedWidth > selfSize.width)
    {
        CGFloat floatingWidth = selfSize.width - fixedWidth;
        CGFloat totalShrink = sbvsc.leadingPosInner.shrink + sbvsc.centerXPosInner.shrink + sbvsc.trailingPosInner.shrink + sbvsc.widthSizeInner.shrink;
        if (totalShrink != 0.0)
        {
            leadingMargin += (sbvsc.leadingPosInner.shrink / totalShrink) * floatingWidth;
            centerMargin += (sbvsc.centerXPosInner.shrink / totalShrink) * floatingWidth;
            trailingMargin += (sbvsc.trailingPosInner.shrink / totalShrink) * floatingWidth;
            pRect->size.width += (sbvsc.widthSizeInner.shrink / totalShrink) * floatingWidth;
        }
    }
    
    //如果是设置水平拉伸则，如果子视图有约束则不受影响，否则就变为和填充一个意思。
    if (horzGravity == MyGravity_Horz_Stretch)
    {
        if (sbvsc.widthSizeInner.dimeVal != nil && sbvsc.widthSizeInner.priority != MyPriority_Low)
            horzGravity = MyGravity_Horz_Leading;
        else
            horzGravity = MyGravity_Horz_Fill;
    }
    
    if (horzGravity == MyGravity_Horz_Leading)
    {
        pRect->origin.x = paddingLeading + leadingMargin;
    }
    else if (horzGravity == MyGravity_Horz_Trailing)
    {
        pRect->origin.x = selfSize.width - paddingTrailing - trailingMargin - pRect->size.width;
    }
    if (horzGravity == MyGravity_Horz_Fill)
    {
        pRect->origin.x = paddingLeading + leadingMargin;
        pRect->size.width = [self myValidMeasure:sbvsc.widthSizeInner sbv:sbv calcSize:selfSize.width - paddingHorz - leadingMargin -  trailingMargin sbvSize:pRect->size selfLayoutSize:selfSize];
    }
    else if (horzGravity == MyGravity_Horz_Center)
    {
        pRect->origin.x = (selfSize.width - paddingHorz - leadingMargin -  trailingMargin - pRect->size.width)/2 + paddingLeading + leadingMargin + centerMargin;
    }
    else if (horzGravity == MyGravity_Horz_Window_Center)
    {
        if (self.window != nil)
        {
            pRect->origin.x = (CGRectGetWidth(self.window.bounds) - leadingMargin - trailingMargin - pRect->size.width)/2 + leadingMargin +  centerMargin;
            pRect->origin.x =  [self.window convertPoint:pRect->origin toView:self].x;
            
            //因为从右到左布局最后统一进行了转换，但是窗口居中是不按布局来控制的，所以这里为了保持不变需要进行特殊处理。
            if ([MyBaseLayout isRTL])
                pRect->origin.x = selfSize.width - pRect->origin.x - pRect->size.width;
        }
    }
    else
    {
        ;
    }
    
    return leadingMargin + centerMargin + trailingMargin + pRect->size.width;
}

-(CGSize)myCalcSizeInNoLayoutSuperview:(UIView*)newSuperview currentSize:(CGSize)size
{
    if (newSuperview == nil || [newSuperview isKindOfClass:[MyBaseLayout class]])
        return size;
    
    CGRect rectSuper = newSuperview.bounds;
    UIView *ssc = newSuperview.myCurrentSizeClassInner;
    UIView *lsc = self.myCurrentSizeClass;
    
    if (!ssc.widthSizeInner.dimeWrapVal)
    {
        if (lsc.widthSizeInner.dimeRelaVal.view == newSuperview)
        {
            if (lsc.widthSizeInner.dimeRelaVal.dime == MyGravity_Horz_Fill)
                size.width = [lsc.widthSizeInner measureWith:rectSuper.size.width];
            else
                size.width = [lsc.widthSizeInner measureWith:rectSuper.size.height];
            
            size.width = [self myValidMeasure:lsc.widthSizeInner sbv:self calcSize:size.width sbvSize:size selfLayoutSize:rectSuper.size];
        }
        else if (lsc.widthSizeInner.dimeFillVal)
        {
            size.width = [lsc.widthSizeInner measureWith:rectSuper.size.width];
        }
        
        if (lsc.leadingPosInner.posVal != nil && lsc.trailingPosInner.posVal != nil)
        {
            if ( lsc.widthSizeInner.dimeVal == nil || lsc.widthSizeInner.priority == MyPriority_Low)
            {
                CGFloat leadingMargin = [lsc.leadingPosInner realPosIn:rectSuper.size.width];
                CGFloat trailingMargin = [lsc.trailingPosInner realPosIn:rectSuper.size.width];
                size.width = rectSuper.size.width - leadingMargin - trailingMargin;
                size.width = [self myValidMeasure:lsc.widthSizeInner sbv:self calcSize:size.width sbvSize:size selfLayoutSize:rectSuper.size];
            }
        }
        
        if (size.width < 0)
            size.width = 0;
    }

    if (!ssc.heightSizeInner.dimeWrapVal)
    {
        if (lsc.heightSizeInner.dimeRelaVal.view == newSuperview)
        {
            if (lsc.heightSizeInner.dimeRelaVal.dime == MyGravity_Vert_Fill)
                size.height = [lsc.heightSizeInner measureWith:rectSuper.size.height];
            else
                size.height = [lsc.heightSizeInner measureWith:rectSuper.size.width];

            size.height = [self myValidMeasure:lsc.heightSizeInner sbv:self calcSize:size.height sbvSize:size selfLayoutSize:rectSuper.size];
        }
        else if (lsc.heightSizeInner.dimeFillVal)
        {
            size.height = [lsc.heightSizeInner measureWith:rectSuper.size.height];
        }
        
        if (lsc.topPosInner.posVal != nil && lsc.bottomPosInner.posVal != nil)
        {
            if (lsc.heightSizeInner.dimeVal == nil || lsc.heightSizeInner.priority == MyPriority_Low)
            {
                CGFloat topMargin = [lsc.topPosInner realPosIn:rectSuper.size.height];
                CGFloat bottomMargin = [lsc.bottomPosInner realPosIn:rectSuper.size.height];
                size.height = rectSuper.size.height - topMargin - bottomMargin;
                size.height = [self myValidMeasure:lsc.heightSizeInner sbv:self calcSize:size.height sbvSize:size selfLayoutSize:rectSuper.size];
            }
        }
        
        if (size.height < 0)
            size.height = 0;
    }
    
    return size;
}

-(BOOL)myUpdateLayoutRectInNoLayoutSuperview:(UIView*)newSuperview
{
    BOOL isAdjust = NO; //这个变量表明是否后续父视图尺寸变化后需要调整更新布局视图的尺寸。
    
    CGRect rectSuper = newSuperview.bounds;
    
    UIView *lsc = self.myCurrentSizeClass;
    
    CGFloat leadingMargin = [lsc.leadingPosInner realPosIn:rectSuper.size.width];
    CGFloat trailingMargin = [lsc.trailingPosInner realPosIn:rectSuper.size.width];
    CGFloat topMargin = [lsc.topPosInner realPosIn:rectSuper.size.height];
    CGFloat bottomMargin = [lsc.bottomPosInner realPosIn:rectSuper.size.height];
    CGRect rectSelf = self.bounds;
    
    //针对滚动父视图做特殊处理，如果父视图是滚动视图，而且当前的缩放比例不为1时系统会调整中心点的位置，因此这里需要特殊处理。
    CGFloat superViewZoomScale = 1.0;
    if ([newSuperview isKindOfClass:[UIScrollView class]])
        superViewZoomScale = ((UIScrollView*)newSuperview).zoomScale;
    
    //得到在设置center后的原始值。
    rectSelf.origin.x = self.center.x - rectSelf.size.width * self.layer.anchorPoint.x * superViewZoomScale;
    rectSelf.origin.y = self.center.y - rectSelf.size.height * self.layer.anchorPoint.y * superViewZoomScale;
    CGRect oldRectSelf = rectSelf;
    
    //确定左右边距和宽度。
    if (lsc.widthSizeInner.dimeVal != nil)
    {
        if (lsc.widthSizeInner.dimeRelaVal != nil)
        {
            if (lsc.widthSizeInner.dimeRelaVal.view == newSuperview)
            {
                isAdjust = YES;

                if (lsc.widthSizeInner.dimeRelaVal.dime == MyGravity_Horz_Fill)
                    rectSelf.size.width = [lsc.widthSizeInner measureWith:rectSuper.size.width];
                else
                    rectSelf.size.width = [lsc.widthSizeInner measureWith:rectSuper.size.height];
            }
            else
            {
                rectSelf.size.width = [lsc.widthSizeInner measureWith:lsc.widthSizeInner.dimeRelaVal.view.myEstimatedWidth];
            }
        }
        else if (lsc.widthSizeInner.dimeNumVal != nil)
        {
            rectSelf.size.width = lsc.widthSizeInner.measure;
        }
        else if (lsc.widthSizeInner.dimeFillVal)
        {
            isAdjust = YES;
            rectSelf.size.width = [lsc.widthSizeInner measureWith:rectSuper.size.width];
        }
        else
        {
            
        }
     }
    
    //这里要判断自己的宽度设置了最小和最大宽度依赖于父视图的情况。如果有这种情况，则父视图在变化时也需要调整自身。
    if (lsc.widthSizeInner.lBoundValInner.dimeRelaVal.view == newSuperview || lsc.widthSizeInner.uBoundValInner.dimeRelaVal.view == newSuperview)
    {
        isAdjust = YES;
    }
    
    rectSelf.size.width = [self myValidMeasure:lsc.widthSizeInner sbv:self calcSize:rectSelf.size.width sbvSize:rectSelf.size selfLayoutSize:rectSuper.size];
    
    if ([MyBaseLayout isRTL])
        rectSelf.origin.x = rectSuper.size.width - rectSelf.origin.x - rectSelf.size.width;
    
    if (lsc.leadingPosInner.posVal != nil && lsc.trailingPosInner.posVal != nil)
    {
        isAdjust = YES;
        //如果宽度约束的优先级很低都按左右边距来决定布局视图的宽度。
        if (lsc.widthSizeInner.priority == MyPriority_Low)
            [lsc.widthSizeInner __setActive:NO];
        
        if (lsc.widthSizeInner.dimeVal == nil)
        {
            rectSelf.size.width = rectSuper.size.width - leadingMargin - trailingMargin;
            rectSelf.size.width = [self myValidMeasure:lsc.widthSizeInner sbv:self calcSize:rectSelf.size.width sbvSize:rectSelf.size selfLayoutSize:rectSuper.size];
        }
        
#if (__IPHONE_OS_VERSION_MAX_ALLOWED >= 110000) || (__TV_OS_VERSION_MAX_ALLOWED >= 110000)
        
        if (@available(iOS 11.0, *)) {
            
            //在ios11后如果是滚动视图的contentInsetAdjustmentBehavior设置为UIScrollViewContentInsetAdjustmentAlways
            //那么系统不管contentSize如何总是会将安全区域叠加到contentInsets所以这里的边距不应该是偏移的边距而是0
            UIScrollView *scrollSuperView = nil;
             if ([newSuperview isKindOfClass:[UIScrollView class]])
               scrollSuperView = (UIScrollView*)newSuperview;
            if (scrollSuperView != nil && lsc.leadingPosInner.isSafeAreaPos)
            {
                leadingMargin = lsc.leadingPosInner.offsetVal + ([MyBaseLayout isRTL] ? scrollSuperView.safeAreaInsets.right : scrollSuperView.safeAreaInsets.left) - ([MyBaseLayout isRTL] ? scrollSuperView.adjustedContentInset.right : scrollSuperView.adjustedContentInset.left);
            }
        }
#endif
        
        rectSelf.origin.x = leadingMargin;
    }
    else if (lsc.centerXPosInner.posVal != nil)
    {
        isAdjust = YES;
        rectSelf.origin.x = (rectSuper.size.width - rectSelf.size.width)/2;
        rectSelf.origin.x += [lsc.centerXPosInner realPosIn:rectSuper.size.width];
    }
    else if (lsc.leadingPosInner.posVal != nil)
    {
#if (__IPHONE_OS_VERSION_MAX_ALLOWED >= 110000) || (__TV_OS_VERSION_MAX_ALLOWED >= 110000)
        
        if (@available(iOS 11.0, *)) {
            
            //iOS11中的滚动条的安全区会叠加到contentInset里面。因此这里要特殊处理，让x轴的开始位置不应该算偏移。
            UIScrollView *scrollSuperView = nil;
            if ([newSuperview isKindOfClass:[UIScrollView class]])
                scrollSuperView = (UIScrollView*)newSuperview;
            if (scrollSuperView != nil && lsc.leadingPosInner.isSafeAreaPos)
            {
                 leadingMargin = lsc.leadingPosInner.offsetVal + ([MyBaseLayout isRTL] ? scrollSuperView.safeAreaInsets.right : scrollSuperView.safeAreaInsets.left) - ([MyBaseLayout isRTL] ? scrollSuperView.adjustedContentInset.right : scrollSuperView.adjustedContentInset.left);
            }
        }
#endif
        rectSelf.origin.x = leadingMargin;
    }
    else if (lsc.trailingPosInner.posVal != nil)
    {
        isAdjust = YES;
        rectSelf.origin.x  = rectSuper.size.width - rectSelf.size.width - trailingMargin;
    }
    else;
    
    if (lsc.heightSizeInner.dimeVal != nil)
    {
        if (lsc.heightSizeInner.dimeRelaVal != nil)
        {
            if (lsc.heightSizeInner.dimeRelaVal.view == newSuperview)
            {
                isAdjust = YES;
                if (lsc.heightSizeInner.dimeRelaVal.dime == MyGravity_Vert_Fill)
                    rectSelf.size.height = [lsc.heightSizeInner measureWith:rectSuper.size.height];
                else
                    rectSelf.size.height = [lsc.heightSizeInner measureWith:rectSuper.size.width];
            }
            else
            {
                rectSelf.size.height = [lsc.heightSizeInner measureWith:lsc.heightSizeInner.dimeRelaVal.view.myEstimatedHeight];
            }
        }
        else if (lsc.heightSizeInner.dimeNumVal != nil)
        {
            rectSelf.size.height = lsc.heightSizeInner.measure;
        }
        else if (lsc.heightSizeInner.dimeFillVal)
        {
            isAdjust = YES;
            rectSelf.size.height = [lsc.heightSizeInner measureWith:rectSuper.size.height];
        }
        else
        {
            // do nothing...
        }
    }
    
    //这里要判断自己的高度设置了最小和最大高度依赖于父视图的情况。如果有这种情况，则父视图在变化时也需要调整自身。
    if (lsc.heightSizeInner.lBoundValInner.dimeRelaVal.view == newSuperview || lsc.heightSizeInner.uBoundValInner.dimeRelaVal.view == newSuperview)
    {
        isAdjust = YES;
    }
    
    rectSelf.size.height = [self myValidMeasure:lsc.heightSizeInner sbv:self calcSize:rectSelf.size.height sbvSize:rectSelf.size selfLayoutSize:rectSuper.size];
    
    if (lsc.topPosInner.posVal != nil && lsc.bottomPosInner.posVal != nil)
    {
        isAdjust = YES;
        //如果高度约束优先级很低则按上下边距来决定布局视图高度。
        if (lsc.heightSizeInner.priority == MyPriority_Low)
            [lsc.heightSizeInner __setActive:NO];
        
        if (lsc.heightSizeInner.dimeVal == nil)
        {
            rectSelf.size.height = rectSuper.size.height - topMargin - bottomMargin;
            rectSelf.size.height = [self myValidMeasure:lsc.heightSizeInner sbv:self calcSize:rectSelf.size.height sbvSize:rectSelf.size selfLayoutSize:rectSuper.size];
        }
        
#if (__IPHONE_OS_VERSION_MAX_ALLOWED >= 110000) || (__TV_OS_VERSION_MAX_ALLOWED >= 110000)
        
        if (@available(iOS 11.0, *)) {
            
            //在ios11后如果是滚动视图的contentInsetAdjustmentBehavior设置为UIScrollViewContentInsetAdjustmentAlways
            //那么系统不管contentSize如何总是会将安全区域叠加到contentInsets所以这里的边距不应该是偏移的边距而是0
            UIScrollView *scrollSuperView = nil;
            if ([newSuperview isKindOfClass:[UIScrollView class]])
                scrollSuperView = (UIScrollView*)newSuperview;
            if (scrollSuperView != nil && lsc.topPosInner.isSafeAreaPos)
            {
                topMargin = lsc.topPosInner.offsetVal + scrollSuperView.safeAreaInsets.top - scrollSuperView.adjustedContentInset.top;
            }
        }
#endif
        
        rectSelf.origin.y = topMargin;
    }
    else if (lsc.centerYPosInner.posVal != nil)
    {
        isAdjust = YES;
        rectSelf.origin.y = (rectSuper.size.height - rectSelf.size.height)/2 + [lsc.centerYPosInner realPosIn:rectSuper.size.height];
    }
    else if (lsc.topPosInner.posVal != nil)
    {
#if (__IPHONE_OS_VERSION_MAX_ALLOWED >= 110000) || (__TV_OS_VERSION_MAX_ALLOWED >= 110000)
        
        if (@available(iOS 11.0, *)) {
            
            //在ios11后如果是滚动视图的contentInsetAdjustmentBehavior设置为UIScrollViewContentInsetAdjustmentAlways
            //那么系统不管contentSize如何总是会将安全区域叠加到contentInsets所以这里的边距不应该是偏移的边距而是0
            UIScrollView *scrollSuperView = nil;
            if ([newSuperview isKindOfClass:[UIScrollView class]])
                scrollSuperView = (UIScrollView*)newSuperview;
            if (scrollSuperView != nil && lsc.topPosInner.isSafeAreaPos)
            {
                topMargin = lsc.topPosInner.offsetVal + scrollSuperView.safeAreaInsets.top - scrollSuperView.adjustedContentInset.top;
            }
        }
#endif
        rectSelf.origin.y = topMargin;
    }
    else if (lsc.bottomPosInner.posVal != nil)
    {
        isAdjust = YES;
        rectSelf.origin.y  = rectSuper.size.height - rectSelf.size.height - bottomMargin;
    }
    else;
    
    if ([MyBaseLayout isRTL])
        rectSelf.origin.x = rectSuper.size.width - rectSelf.origin.x - rectSelf.size.width;
    
    rectSelf = _myCGRectRound(rectSelf);
    if (!_myCGRectEqual(rectSelf, oldRectSelf))
    {
        if (rectSelf.size.width < 0)
            rectSelf.size.width = 0;
        if (rectSelf.size.height < 0)
            rectSelf.size.height = 0;
        
        if (CGAffineTransformIsIdentity(self.transform))
        {
            self.frame = rectSelf;
        }
        else
        {
            self.bounds = CGRectMake(self.bounds.origin.x, self.bounds.origin.y,rectSelf.size.width, rectSelf.size.height);
            self.center = CGPointMake(rectSelf.origin.x + self.layer.anchorPoint.x * rectSelf.size.width * superViewZoomScale, rectSelf.origin.y + self.layer.anchorPoint.y * rectSelf.size.height * superViewZoomScale);
        }
    }
    else if (lsc.widthSizeInner.dimeWrapVal || lsc.heightSizeInner.dimeWrapVal)
    {
        [self setNeedsLayout];
    }
    
    return isAdjust;
}

-(CGFloat)mySubview:(MyViewSizeClass*)sbvsc wrapHeightSizeFits:(CGFloat)width
{
    UIView *sbv = sbvsc.view;
    CGFloat h = [sbv sizeThatFits:CGSizeMake(width, 0)].height;
    if ([sbv isKindOfClass:[UIImageView class]])
    {
        //根据图片的尺寸进行等比缩放得到合适的高度。
        if (!sbvsc.widthSizeInner.dimeWrapVal)
        {
            UIImage *img = ((UIImageView*)sbv).image;
            if (img != nil && img.size.width != 0)
                h = img.size.height * (width / img.size.width);
        }
    }
    else if ([sbv isKindOfClass:[UIButton class]])
    {
        //按钮特殊处理多行的。。
        UIButton *button = (UIButton*)sbv;
        if (button.titleLabel != nil)
        {
            //得到按钮本身的高度，以及单行文本的高度，这样就能算出按钮和文本的间距
            CGSize buttonSize = [button sizeThatFits:CGSizeMake(0, 0)];
            CGSize buttonTitleSize = [button.titleLabel sizeThatFits:CGSizeMake(0, 0)];
            CGSize sz = [button.titleLabel sizeThatFits:CGSizeMake(width, 0)];
            h = sz.height + buttonSize.height - buttonTitleSize.height; //这个sz只是纯文本的高度，所以要加上原先按钮和文本的高度差。。
        }
    }
    else
    {
        // do nothing...
    }
    
    return [sbvsc.heightSizeInner measureWith:h];
}

-(CGFloat)myGetBoundLimitMeasure:(MyLayoutSize*)boundDime sbv:(UIView*)sbv dimeType:(MyGravity)dimeType sbvSize:(CGSize)sbvSize selfLayoutSize:(CGSize)selfLayoutSize isUBound:(BOOL)isUBound
{
    CGFloat value = isUBound ? CGFLOAT_MAX : -CGFLOAT_MAX;
    if (boundDime == nil || !boundDime.isActive)
        return value;
    
    MyLayoutValueType lValueType = boundDime.dimeValType;
    if (lValueType == MyLayoutValueType_NSNumber || lValueType == MyLayoutValueType_Most)
    {
        value = boundDime.dimeNumVal.doubleValue;
    }
    else if (lValueType == MyLayoutValueType_LayoutDime)
    {
        if (boundDime.dimeRelaVal.view == self)
        {
            if (boundDime.dimeRelaVal.dime == MyGravity_Horz_Fill)
                value = selfLayoutSize.width - (boundDime.dimeRelaVal.view == self ? (self.myLayoutLeadingPadding + self.myLayoutTrailingPadding) : 0);
            else
                value = selfLayoutSize.height - (boundDime.dimeRelaVal.view == self ? (self.myLayoutTopPadding + self.myLayoutBottomPadding) :0);
        }
        else if (boundDime.dimeRelaVal.view == sbv)
        {
            if (boundDime.dimeRelaVal.dime == dimeType)
            {
                //约束冲突：无效的边界设置方法
                NSCAssert(0, @"Constraint exception!! %@ has invalid lBound or uBound setting",sbv);
            }
            else
            {
                if (boundDime.dimeRelaVal.dime == MyGravity_Horz_Fill)
                    value = sbvSize.width;
                else
                    value = sbvSize.height;
            }
        }
        else
        {
            if (boundDime.dimeRelaVal.dime == MyGravity_Horz_Fill)
                value = boundDime.dimeRelaVal.view.myEstimatedWidth;
            else
                value = boundDime.dimeRelaVal.view.myEstimatedHeight;
        }
        
    }
    else if (lValueType == MyLayoutValueType_Wrap)
    {
        if (dimeType == MyGravity_Horz_Fill)
            value = sbvSize.width;
        else
            value = sbvSize.height;
    }
    else
    {
        //约束冲突：无效的边界设置方法
        NSCAssert(0, @"Constraint exception!! %@ has invalid lBound or uBound setting",sbv);
    }
    
    if (value == CGFLOAT_MAX || value == -CGFLOAT_MAX)
        return value;
    
    return  [boundDime measureWith:value];
}

-(CGFloat)myValidMeasure:(MyLayoutSize*)dime sbv:(UIView*)sbv calcSize:(CGFloat)calcSize sbvSize:(CGSize)sbvSize selfLayoutSize:(CGSize)selfLayoutSize
{
    if (calcSize < 0.0)
        calcSize = 0.0;
    
    if (dime == nil)
        return calcSize;
    
    //算出最大最小值。
    CGFloat min = dime.isActive? [self myGetBoundLimitMeasure:dime.lBoundValInner sbv:sbv dimeType:dime.dime sbvSize:sbvSize selfLayoutSize:selfLayoutSize isUBound:NO] : -CGFLOAT_MAX;
    CGFloat max = dime.isActive ?  [self myGetBoundLimitMeasure:dime.uBoundValInner sbv:sbv dimeType:dime.dime sbvSize:sbvSize selfLayoutSize:selfLayoutSize isUBound:YES] : CGFLOAT_MAX;
    
    calcSize = _myCGFloatMax(min, calcSize);
    calcSize = _myCGFloatMin(max, calcSize);
    
    return calcSize;
}

-(CGFloat)myGetBound:(MyLayoutPos*)boundPos limitMarginOfSubview:(UIView*)sbv
{
    CGFloat value = 0;
    if (boundPos == nil)
        return value;
    
    MyLayoutValueType lValueType = boundPos.posValType;
    if (lValueType == MyLayoutValueType_NSNumber)
        value = boundPos.posNumVal.doubleValue;
    else if (lValueType == MyLayoutValueType_LayoutPos)
    {
        CGRect rect = boundPos.posRelaVal.view.myFrame.frame;
        
        MyGravity pos = boundPos.posRelaVal.pos;
        if (pos == MyGravity_Horz_Leading)
        {
            if (rect.origin.x != CGFLOAT_MAX)
                value = CGRectGetMinX(rect);
        }
        else if (pos == MyGravity_Horz_Center)
        {
            if (rect.origin.x != CGFLOAT_MAX)
                value = CGRectGetMidX(rect);
        }
        else if (pos == MyGravity_Horz_Trailing)
        {
            if (rect.origin.x != CGFLOAT_MAX)
                value = CGRectGetMaxX(rect);
        }
        else if (pos == MyGravity_Vert_Top)
        {
            if (rect.origin.y != CGFLOAT_MAX)
                value = CGRectGetMinY(rect);
        }
        else if (pos == MyGravity_Vert_Center)
        {
            if (rect.origin.y != CGFLOAT_MAX)
                value = CGRectGetMidY(rect);
        }
        else if (pos == MyGravity_Vert_Bottom)
        {
            if (rect.origin.y != CGFLOAT_MAX)
                value = CGRectGetMaxY(rect);
        }
    }
    else
    {
        //约束冲突：无效的边界设置方法
        NSCAssert(0, @"Constraint exception!! %@ has invalid lBound or uBound setting",sbv);
    }
    
    return value + boundPos.offsetVal;
}

-(CGFloat)myValidMargin:(MyLayoutPos*)pos sbv:(UIView*)sbv calcPos:(CGFloat)calcPos selfLayoutSize:(CGSize)selfLayoutSize
{
    if (pos == nil)
        return calcPos;
    
    //算出最大最小值
    CGFloat min = (pos.isActive && pos.lBoundValInner != nil) ? [self myGetBound:pos.lBoundValInner limitMarginOfSubview:sbv] : -CGFLOAT_MAX;
    CGFloat max = (pos.isActive && pos.uBoundValInner != nil) ? [self myGetBound:pos.uBoundValInner limitMarginOfSubview:sbv] : CGFLOAT_MAX;
    
    calcPos = _myCGFloatMax(min, calcPos);
    calcPos = _myCGFloatMin(max, calcPos);
    return calcPos;
}

-(BOOL)myIsNoLayoutSubview:(UIView*)sbv
{
    UIView *sbvsc = sbv.myCurrentSizeClass;
    
    if (sbvsc.useFrame)
        return YES;
    
    if (sbv.isHidden)
        return sbvsc.visibility != MyVisibility_Invisible;
    else
        return sbvsc.visibility == MyVisibility_Gone;
}

-(NSMutableArray*)myGetLayoutSubviews
{
    return [self myGetLayoutSubviewsFrom:self.subviews];
}

-(NSMutableArray*)myGetLayoutSubviewsFrom:(NSArray*)sbsFrom
{
    NSMutableArray *sbs = [NSMutableArray arrayWithCapacity:sbsFrom.count];
    BOOL isReverseLayout = self.reverseLayout;
    
    if (isReverseLayout)
        [sbs addObjectsFromArray:[sbsFrom reverseObjectEnumerator].allObjects];
    else
        [sbs addObjectsFromArray:sbsFrom];
    
    for (NSInteger i = sbs.count - 1; i >= 0; i--)
    {
        UIView *sbv = sbs[i];
        if ([self myIsNoLayoutSubview:sbv])
            [sbs removeObjectAtIndex:i];
    }
    
    return sbs;
}

-(CGSize)myLayout:(MyLayoutViewSizeClass*)lsc adjustSelfSize:(CGSize)selfSize withSubviews:(NSArray*)sbs
{
    //调整布局视图自己的尺寸。
    selfSize.height = [self myValidMeasure:lsc.heightSizeInner sbv:self calcSize:selfSize.height sbvSize:selfSize selfLayoutSize:self.superview.bounds.size];
    
    selfSize.width = [self myValidMeasure:lsc.widthSizeInner sbv:self calcSize:selfSize.width sbvSize:selfSize selfLayoutSize:self.superview.bounds.size];
    
    //对所有子视图进行布局变换
    CGAffineTransform layoutTransform = lsc.layoutTransform;
    if (!CGAffineTransformIsIdentity(layoutTransform))
    {
        for (UIView *sbv in sbs)
        {
            MyFrame *myFrame = sbv.myFrame;
            
            //取子视图中心点坐标。因为这个坐标系的原点是布局视图的左上角，所以要转化为数学坐标系的原点坐标, 才能应用坐标变换。
            CGPoint centerPoint = CGPointMake(myFrame.leading + myFrame.width / 2 - selfSize.width / 2,
                                              myFrame.top + myFrame.height / 2 - selfSize.height / 2);
            
            //应用坐标变换
            centerPoint = CGPointApplyAffineTransform(centerPoint, layoutTransform);
            
            //还原为左上角坐标系。
            centerPoint.x +=  selfSize.width / 2;
            centerPoint.y += selfSize.height / 2;
            
            //根据中心点的变化调整开始和结束位置。
            myFrame.leading = centerPoint.x - myFrame.width / 2;
            myFrame.trailing = myFrame.leading + myFrame.width;
            myFrame.top = centerPoint.y - myFrame.height / 2;
            myFrame.bottom = myFrame.top + myFrame.height;
        }
    }
    
    //对所有子视图进行RTL设置
    if ([MyBaseLayout isRTL])
    {
        for (UIView *sbv in sbs)
        {
            MyFrame *myFrame = sbv.myFrame;
            myFrame.leading = selfSize.width - myFrame.leading - myFrame.width;
            myFrame.trailing = myFrame.leading + myFrame.width;
        }
    }
    
    //如果没有子视图，并且padding不参与空子视图尺寸计算则尺寸应该扣除padding的值。
    if (sbs.count == 0 && !lsc.zeroPadding)
    {
        if (lsc.widthSizeInner.dimeWrapVal)
            selfSize.width -= (lsc.myLayoutLeadingPadding + lsc.myLayoutTrailingPadding);
        if (lsc.heightSizeInner.dimeWrapVal)
            selfSize.height -= (lsc.myLayoutTopPadding + lsc.myLayoutBottomPadding);
    }
    
    return selfSize;    
}

-(MyGravity)myConvertLeftRightGravityToLeadingTrailing:(MyGravity)horzGravity
{
    if (horzGravity == MyGravity_Horz_Left)
    {
        if ([MyBaseLayout isRTL])
            return MyGravity_Horz_Trailing;
        else
            return MyGravity_Horz_Leading;
    }
    else if (horzGravity == MyGravity_Horz_Right)
    {
        if ([MyBaseLayout isRTL])
            return MyGravity_Horz_Leading;
        else
            return MyGravity_Horz_Trailing;
    }
    else
        return horzGravity;
    
}

-(UIFont*)myGetSubviewFont:(UIView*)sbv
{
    UIFont *sbvFont = nil;
    if ([sbv isKindOfClass:[UILabel class]] ||
        [sbv isKindOfClass:[UITextField class]] ||
        [sbv isKindOfClass:[UITextView class]] ||
        [sbv isKindOfClass:[UIButton class]])
    {
        sbvFont = [sbv valueForKey:@"font"];
    }
    
    return sbvFont;
}

-(CGFloat)myLayoutTopPadding
{
    return self.myCurrentSizeClass.myLayoutTopPadding;
}
-(CGFloat)myLayoutBottomPadding
{
    return self.myCurrentSizeClass.myLayoutBottomPadding;
}
-(CGFloat)myLayoutLeftPadding
{
    return self.myCurrentSizeClass.myLayoutLeftPadding;
}
-(CGFloat)myLayoutRightPadding
{
    return self.myCurrentSizeClass.myLayoutRightPadding;
}
-(CGFloat)myLayoutLeadingPadding
{
    return self.myCurrentSizeClass.myLayoutLeadingPadding;
}
-(CGFloat)myLayoutTrailingPadding
{
    return self.myCurrentSizeClass.myLayoutTrailingPadding;
}

- (void)myLayout:(MyBaseLayout*)lsc adjustScrollViewContentWithSize:(CGSize)newSize
{
    if (self.adjustScrollViewContentSizeMode == MyAdjustScrollViewContentSizeModeYes && self.superview != nil && [self.superview isKindOfClass:[UIScrollView class]])
    {
        UIScrollView *scrolv = (UIScrollView*)self.superview;
        CGSize contsize = scrolv.contentSize;
        CGRect rectSuper = scrolv.bounds;
        
        //这里把自己在父视图中的上下左右边距也算在contentSize的包容范围内。
        CGFloat leadingMargin = [lsc.leadingPosInner realPosIn:rectSuper.size.width];
        CGFloat trailingMargin = [lsc.trailingPosInner realPosIn:rectSuper.size.width];
        CGFloat topMargin = [lsc.topPosInner realPosIn:rectSuper.size.height];
        CGFloat bottomMargin = [lsc.bottomPosInner realPosIn:rectSuper.size.height];
        
#if (__IPHONE_OS_VERSION_MAX_ALLOWED >= 110000) || (__TV_OS_VERSION_MAX_ALLOWED >= 110000)
        if (@available(iOS 11.0, *)) {
            if (/*scrolv.contentInsetAdjustmentBehavior == UIScrollViewContentInsetAdjustmentAlways*/ 1)
            {
                if (lsc.leadingPosInner.isSafeAreaPos)
                    leadingMargin = lsc.leadingPosInner.offsetVal;// + scrolv.safeAreaInsets.left - scrolv.adjustedContentInset.left;
                
                if (lsc.trailingPosInner.isSafeAreaPos)
                    trailingMargin = lsc.trailingPosInner.offsetVal;// + scrolv.safeAreaInsets.right - scrolv.adjustedContentInset.right;
                
                if (lsc.topPosInner.isSafeAreaPos)
                    topMargin = lsc.topPosInner.offsetVal;
                
                if (lsc.bottomPosInner.isSafeAreaPos)
                    bottomMargin = lsc.bottomPosInner.offsetVal;
            }
        }
#endif
 
        if (contsize.height != newSize.height + topMargin + bottomMargin)
            contsize.height = newSize.height + topMargin + bottomMargin;
        if (contsize.width != newSize.width + leadingMargin + trailingMargin)
            contsize.width = newSize.width + leadingMargin + trailingMargin;
        
        //因为调整contentsize可能会调整contentOffset，所以为了保持一致性这里要还原掉原来的contentOffset
        CGPoint oldOffset = scrolv.contentOffset;
        
        contsize.width *= scrolv.zoomScale;
        contsize.height *= scrolv.zoomScale;
        
        
        if (!CGSizeEqualToSize(scrolv.contentSize, contsize))
            scrolv.contentSize =  contsize;
        
        if ((oldOffset.x <= 0 || oldOffset.x <= contsize.width - rectSuper.size.width) &&
            (oldOffset.y <= 0 || oldOffset.y <= contsize.height - rectSuper.size.height))
        {
            if (!CGPointEqualToPoint(scrolv.contentOffset, oldOffset))
                scrolv.contentOffset = oldOffset;
        }
    }
}

MySizeClass _myGlobalSizeClass = 0xFF;

//获取全局的当前的SizeClass,减少获取次数的调用。
-(MySizeClass)myGetGlobalSizeClass
{
    //找到最根部的父视图。
    if (_myGlobalSizeClass == 0xFF || ![self.superview isKindOfClass:[MyBaseLayout class]])
    {
        MySizeClass sizeClass;
        if ([UIDevice currentDevice].systemVersion.floatValue < 8)
            sizeClass = MySizeClass_hAny | MySizeClass_wAny;
        else
            sizeClass = (MySizeClass)((self.traitCollection.verticalSizeClass << 2) | self.traitCollection.horizontalSizeClass);
#if TARGET_OS_IOS
        UIDeviceOrientation ori =   [UIDevice currentDevice].orientation;
        if (UIDeviceOrientationIsPortrait(ori))
            sizeClass |= MySizeClass_Portrait;
        else if (UIDeviceOrientationIsLandscape(ori))
            sizeClass |= MySizeClass_Landscape;
        else //如果 ori == UIDeviceOrientationUnknown 的话, 默认给竖屏设置
            sizeClass |= MySizeClass_Portrait;
#endif
        _myGlobalSizeClass = sizeClass;
    }
    else
    {
        ;
    }
    
    return _myGlobalSizeClass;
}

-(void)myRemoveSubviewObserver:(UIView*)subview
{
    MyFrame *sbvmyFrame = objc_getAssociatedObject(subview, ASSOCIATEDOBJECT_KEY_MYLAYOUT_FRAME);
    if (sbvmyFrame != nil)
    {
        sbvmyFrame.sizeClass.viewLayoutCompleteBlock = nil;
        if (sbvmyFrame.hasObserver)
        {
            sbvmyFrame.hasObserver = NO;
            if (![subview isKindOfClass:[MyBaseLayout class]])
            {
                [subview removeObserver:self forKeyPath:@"hidden"];
                [subview removeObserver:self forKeyPath:@"frame"];
                
                if ([subview isKindOfClass:[UIScrollView class]])
                {
                    [subview removeObserver:self forKeyPath:@"center"];
                }
                else if ([subview isKindOfClass:[UILabel class]])
                {
                    [subview removeObserver:self forKeyPath:@"text"];
                    [subview removeObserver:self forKeyPath:@"attributedText"];
                }
                else
                {
                    
                }
            }
        }
    }
}

-(void)myAddSubviewObserver:(UIView*)subview sbvmyFrame:(MyFrame*)sbvmyFrame
{
    if (!sbvmyFrame.hasObserver)
    {
        sbvmyFrame.hasObserver = YES;

        //非布局子视图添加hidden, frame的属性变化通知。
        if (![subview isKindOfClass:[MyBaseLayout class]])
        {
            [subview addObserver:self forKeyPath:@"hidden" options:NSKeyValueObservingOptionNew context:_myObserverContextA];
            [subview addObserver:self forKeyPath:@"frame" options:NSKeyValueObservingOptionNew context:_myObserverContextA];
            
            if ([subview isKindOfClass:[UIScrollView class]])
            {//如果是UIScrollView则需要特殊监听center属性
                //有时候我们可能会把滚动视图加入到布局视图中去，滚动视图的尺寸有可能设置为高度自适应,这样就会调整center。从而需要重新激发滚动视图的布局
                //这也就是为什么只监听center的原因了。
                [subview addObserver:self forKeyPath:@"center" options:NSKeyValueObservingOptionNew context:_myObserverContextA];
            }
            else if ([subview isKindOfClass:[UILabel class]])
            {//如果是UILabel则监听text和attributedText属性
                [subview addObserver:self forKeyPath:@"text" options:NSKeyValueObservingOptionNew context:_myObserverContextB];
                [subview addObserver:self forKeyPath:@"attributedText" options:NSKeyValueObservingOptionNew context:_myObserverContextB];
            }
            else
            {
                
            }
        }
    }
}

-(void)myLayout:(MyLayoutViewSizeClass*)lsc adjustSizeSettingOfSubview:(MyViewSizeClass*)sbvsc isEstimate:(BOOL)isEstimate sbvmyFrame:(MyFrame*)sbvmyFrame  selfSize:(CGSize)selfSize vertGravity:(MyGravity)vertGravity horzGravity:(MyGravity)horzGravity sizeClass:(MySizeClass)sizeClass pHasSubLayout:(BOOL*)pHasSubLayout
{
    UIView *sbv = sbvsc.view;
    
    if (!isEstimate)
        sbvmyFrame.frame = sbv.bounds;
    
    //只要子视图是包裹并且布局视图是fill填充，都应该清除子视图的包裹设置。
    if (sbvsc.widthSizeInner.dimeWrapVal && horzGravity == MyGravity_Horz_Fill)
        [sbvsc.widthSizeInner __setActive:NO];
    if (sbvsc.heightSizeInner.dimeWrapVal && vertGravity == MyGravity_Vert_Fill)
        [sbvsc.heightSizeInner __setActive:NO];
    
    if (sbvsc.leadingPosInner.posVal != nil &&
        sbvsc.trailingPosInner.posVal != nil &&
        (sbvsc.widthSizeInner.priority == MyPriority_Low || !lsc.widthSizeInner.dimeWrapVal))
        [sbvsc.widthSizeInner __setActive:NO];
    
    if (sbvsc.topPosInner.posVal != nil &&
        sbvsc.bottomPosInner.posVal != nil &&
        (sbvsc.heightSizeInner.priority == MyPriority_Low || !lsc.heightSizeInner.dimeWrapVal))
        [sbvsc.heightSizeInner __setActive:NO];
    
    if ([sbv isKindOfClass:[MyBaseLayout class]])
    {
        
        if (pHasSubLayout != nil && (sbvsc.heightSizeInner.dimeWrapVal || sbvsc.widthSizeInner.dimeWrapVal))
            *pHasSubLayout = YES;
        
        if (isEstimate && (sbvsc.heightSizeInner.dimeWrapVal || sbvsc.widthSizeInner.dimeWrapVal))
        {
            [(MyBaseLayout*)sbv sizeThatFits:sbvmyFrame.frame.size inSizeClass:sizeClass];
            //因为estimateLayoutRect执行后会还原，所以这里要重新设置
            if (sbvmyFrame.multiple)
                sbvmyFrame.sizeClass = [sbv myBestSizeClass:sizeClass myFrame:sbvmyFrame];
        }
    }
}

-(CGFloat)myLayout:(MyLayoutViewSizeClass*)lsc
widthSizeValueOfSubview:(MyViewSizeClass *)sbvsc
          selfSize:(CGSize)selfSize
           sbvSize:(CGSize)sbvSize
        paddingTop:(CGFloat)paddingTop
    paddingLeading:(CGFloat)paddingLeading
     paddingBottom:(CGFloat)paddingBottom
   paddingTrailing:(CGFloat)paddingTrailing
{
    CGFloat retVal = sbvSize.width;
    
    MyLayoutSize *sbvWidthSizeInner = sbvsc.widthSizeInner;
    
    if (sbvWidthSizeInner.dimeNumVal != nil)
    {//宽度等于固定的值。
        retVal =  sbvWidthSizeInner.measure;
    }
    else if (sbvWidthSizeInner.dimeRelaVal != nil && sbvWidthSizeInner.dimeRelaVal.view != sbvsc.view)
    {//宽度等于其他的依赖的视图。
        
        if (sbvWidthSizeInner.dimeRelaVal == lsc.widthSizeInner)
        {
            retVal = [sbvWidthSizeInner measureWith:selfSize.width - paddingLeading - paddingTrailing];
        }
        else if (sbvWidthSizeInner.dimeRelaVal == lsc.heightSizeInner)
        {
            retVal = [sbvWidthSizeInner measureWith:selfSize.height - paddingTop - paddingBottom];
        }
        else
        {
            if (sbvWidthSizeInner.dimeRelaVal.dime == MyGravity_Horz_Fill)
                retVal = [sbvWidthSizeInner measureWith:sbvWidthSizeInner.dimeRelaVal.view.myEstimatedWidth];
            else
                retVal = [sbvWidthSizeInner measureWith:sbvWidthSizeInner.dimeRelaVal.view.myEstimatedHeight];
        }
    }
    else if (sbvWidthSizeInner.dimeFillVal)
    {
        retVal = [sbvWidthSizeInner measureWith:selfSize.width - paddingLeading - paddingTrailing];
    }
    else if (sbvWidthSizeInner.dimeWrapVal)
    {
        if (![sbvsc.view isKindOfClass:[MyBaseLayout class]])
            retVal = [sbvWidthSizeInner measureWith:[sbvsc.view sizeThatFits:CGSizeMake(0, sbvSize.height)].width];
    }
    
    return retVal;
}

-(CGFloat)myLayout:(MyLayoutViewSizeClass*)lsc
heightSizeValueOfSubview:(MyViewSizeClass *)sbvsc
          selfSize:(CGSize)selfSize
           sbvSize:(CGSize)sbvSize
        paddingTop:(CGFloat)paddingTop
    paddingLeading:(CGFloat)paddingLeading
     paddingBottom:(CGFloat)paddingBottom
   paddingTrailing:(CGFloat)paddingTrailing
{
    CGFloat retVal = sbvSize.height;
    MyLayoutSize *sbvHeightSizeInner = sbvsc.heightSizeInner;
    
    if (sbvHeightSizeInner.dimeNumVal != nil)
    {//高度等于固定的值。
        retVal = sbvHeightSizeInner.measure;
    }
    else if (sbvHeightSizeInner.dimeRelaVal != nil && sbvHeightSizeInner.dimeRelaVal.view != sbvsc.view)
    {//高度等于其他依赖的视图
        if (sbvHeightSizeInner.dimeRelaVal == lsc.heightSizeInner)
        {
            retVal = [sbvHeightSizeInner measureWith:selfSize.height - paddingTop - paddingBottom];
        }
        else if (sbvHeightSizeInner.dimeRelaVal == lsc.widthSizeInner)
        {
            retVal = [sbvHeightSizeInner measureWith:selfSize.width - paddingLeading - paddingTrailing];
        }
        else
        {
            if (sbvHeightSizeInner.dimeRelaVal.dime == MyGravity_Horz_Fill)
                retVal = [sbvHeightSizeInner measureWith:sbvHeightSizeInner.dimeRelaVal.view.myEstimatedWidth];
            else
                retVal = [sbvHeightSizeInner measureWith:sbvHeightSizeInner.dimeRelaVal.view.myEstimatedHeight];
        }
    }
    else if (sbvHeightSizeInner.dimeFillVal)
    {
        retVal = [sbvHeightSizeInner measureWith:selfSize.height - paddingTop - paddingBottom];
    }
    else if (sbvHeightSizeInner.dimeWrapVal)
    {
        if (![sbvsc.view isKindOfClass:[MyBaseLayout class]])
            retVal = [self mySubview:sbvsc wrapHeightSizeFits:sbvSize.width];
    }
    
    
    return retVal;
}

-(void)myLayout:(MyLayoutViewSizeClass*)lsc
calcRectOfSubview:(MyViewSizeClass*)sbvsc
     sbvmyFrame:(MyFrame*)sbvmyFrame
    vertGravity:(MyGravity)vertGravity
    horzGravity:(MyGravity)horzGravity
     inSelfSize:(CGSize)selfSize
     paddingTop:(CGFloat)paddingTop
 paddingLeading:(CGFloat)paddingLeading
  paddingBottom:(CGFloat)paddingBottom
paddingTrailing:(CGFloat)paddingTrailing
   pMaxWrapSize:(CGSize*)pMaxWrapSize
{
    CGRect rect = sbvmyFrame.frame;
    
    rect.size.width = [self myLayout:lsc widthSizeValueOfSubview:sbvsc selfSize:selfSize sbvSize:rect.size paddingTop:paddingTop paddingLeading:paddingLeading paddingBottom:paddingBottom paddingTrailing:paddingTrailing];
    
    rect.size.width = [self myValidMeasure:sbvsc.widthSizeInner sbv:sbvsc.view calcSize:rect.size.width sbvSize:rect.size selfLayoutSize:selfSize];
    [self myCalcSubview:sbvsc horzGravity:[self myGetSubview:sbvsc horzGravity:horzGravity] paddingLeading:paddingLeading paddingTrailing:paddingTrailing selfSize:selfSize pRect:&rect];
    
    rect.size.height = [self myLayout:lsc heightSizeValueOfSubview:sbvsc selfSize:selfSize sbvSize:rect.size paddingTop:paddingTop paddingLeading:paddingLeading paddingBottom:paddingBottom paddingTrailing:paddingTrailing];
    
    rect.size.height = [self myValidMeasure:sbvsc.heightSizeInner sbv:sbvsc.view calcSize:rect.size.height sbvSize:rect.size selfLayoutSize:selfSize];
    [self myCalcSubview:sbvsc vertGravity:[self myGetSubview:sbvsc vertGravity:vertGravity] paddingTop:paddingTop paddingBottom:paddingBottom baselinePos:CGFLOAT_MAX selfSize:selfSize pRect:&rect];
    
    
    //特殊处理宽度等于高度
    if (sbvsc.widthSizeInner.dimeRelaVal.view == sbvsc.view && sbvsc.widthSizeInner.dimeRelaVal.dime == MyGravity_Vert_Fill)
    {
        rect.size.width = [sbvsc.widthSizeInner measureWith:rect.size.height];
        rect.size.width = [self myValidMeasure:sbvsc.widthSizeInner sbv:sbvsc.view calcSize:rect.size.width sbvSize:rect.size selfLayoutSize:selfSize];
        
        [self myCalcSubview:sbvsc horzGravity:[self myGetSubview:sbvsc horzGravity:horzGravity] paddingLeading:paddingLeading paddingTrailing:paddingTrailing selfSize:selfSize pRect:&rect];
    }
    
    //特殊处理高度等于宽度。
    if (sbvsc.heightSizeInner.dimeRelaVal.view == sbvsc.view && sbvsc.heightSizeInner.dimeRelaVal.dime == MyGravity_Horz_Fill)
    {
        rect.size.height = [sbvsc.heightSizeInner measureWith:rect.size.width];
        
        if (sbvsc.heightSizeInner.dimeWrapVal && ![sbvsc.view isKindOfClass:[MyBaseLayout class]])
            rect.size.height = [self mySubview:sbvsc wrapHeightSizeFits:rect.size.width];
        
        rect.size.height = [self myValidMeasure:sbvsc.heightSizeInner sbv:sbvsc.view calcSize:rect.size.height sbvSize:rect.size selfLayoutSize:selfSize];
        
        [self myCalcSubview:sbvsc vertGravity:[self myGetSubview:sbvsc vertGravity:vertGravity] paddingTop:paddingTop paddingBottom:paddingBottom baselinePos:CGFLOAT_MAX selfSize:selfSize pRect:&rect];
    }
    
    sbvmyFrame.frame = rect;
    
    if (pMaxWrapSize != NULL)
    {
        if (lsc.widthSizeInner.dimeWrapVal)
        {
            //如果同时设置左右边界则左右边界为最小的宽度
            if (sbvsc.leadingPosInner.posVal != nil && sbvsc.trailingPosInner.posVal != nil)
            {
                if (_myCGFloatLess(pMaxWrapSize->width, sbvsc.leadingPosInner.absVal + sbvsc.trailingPosInner.absVal + paddingLeading + paddingTrailing))
                    pMaxWrapSize->width = sbvsc.leadingPosInner.absVal + sbvsc.trailingPosInner.absVal + paddingLeading + paddingTrailing;
            }
            
            //宽度不依赖布局则参与最大宽度计算。
            if ((sbvsc.widthSizeInner.dimeRelaVal == nil || sbvsc.widthSizeInner.dimeRelaVal != lsc.widthSizeInner) && !sbvsc.widthSizeInner.dimeFillVal)
            {
                if (_myCGFloatLess(pMaxWrapSize->width, sbvmyFrame.width + sbvsc.leadingPosInner.absVal + sbvsc.centerXPosInner.absVal + sbvsc.trailingPosInner.absVal + paddingLeading + paddingTrailing))
                    pMaxWrapSize->width = sbvmyFrame.width + sbvsc.leadingPosInner.absVal + sbvsc.centerXPosInner.absVal + sbvsc.trailingPosInner.absVal + paddingLeading + paddingTrailing;
                
                //只有不居中和底部对齐才比较底部。
                if (sbvsc.centerXPosInner.posVal == nil &&
                    sbvsc.trailingPosInner.posVal == nil &&
                    _myCGFloatLess(pMaxWrapSize->width,sbvmyFrame.trailing + sbvsc.trailingPosInner.absVal + paddingTrailing))
                {
                    pMaxWrapSize->width = sbvmyFrame.trailing + sbvsc.trailingPosInner.absVal + paddingTrailing;
                }
            }
        }
        
        if (lsc.heightSizeInner.dimeWrapVal)
        {
            //如果同时设置上下边界则上下边界为最小的高度
            if (sbvsc.topPosInner.posVal != nil && sbvsc.bottomPosInner.posVal != nil)
            {
                if (_myCGFloatLess(pMaxWrapSize->height, sbvsc.topPosInner.absVal + sbvsc.bottomPosInner.absVal + paddingTop + paddingBottom))
                    pMaxWrapSize->height = sbvsc.topPosInner.absVal + sbvsc.bottomPosInner.absVal + paddingTop + paddingBottom;
            }
            
            //高度不依赖布局则参与最大高度计算。
             if ((sbvsc.heightSizeInner.dimeRelaVal == nil || sbvsc.heightSizeInner.dimeRelaVal != lsc.heightSizeInner) && !sbvsc.heightSizeInner.dimeFillVal)
            {
                if (_myCGFloatLess(pMaxWrapSize->height, sbvmyFrame.height + sbvsc.topPosInner.absVal + sbvsc.centerYPosInner.absVal + sbvsc.bottomPosInner.absVal + paddingTop + paddingBottom))
                    pMaxWrapSize->height = sbvmyFrame.height + sbvsc.topPosInner.absVal + sbvsc.centerYPosInner.absVal + sbvsc.bottomPosInner.absVal + paddingTop + paddingBottom;
                
                //只有在不居中对齐和底部对齐时才比较底部。
                if (sbvsc.centerYPosInner.posVal == nil &&
                    sbvsc.bottomPosInner.posVal == nil &&
                    _myCGFloatLess(pMaxWrapSize->height, sbvmyFrame.bottom + sbvsc.bottomPosInner.absVal + paddingBottom))
                {
                    pMaxWrapSize->height = sbvmyFrame.bottom + sbvsc.bottomPosInner.absVal + paddingBottom;
                }
            }
        }
    }
}

-(void)myHookSublayout:(MyBaseLayout *)sublayout borderlineRect:(CGRect *)pRect
{
    //do nothing...
}

-(void)myInvalidateIntrinsicContentSize
{
    if (!self.translatesAutoresizingMaskIntoConstraints)
    {
        if (self.widthSizeInner.dimeWrapVal || self.heightSizeInner.dimeWrapVal)
            [self invalidateIntrinsicContentSize];
    }
}

-(void)myCalcSubviewsWrapContentSize:(NSArray<UIView *>*)sbs isEstimate:(BOOL)isEstimate pHasSubLayout:(BOOL*)pHasSubLayout sizeClass:(MySizeClass)sizeClass withCustomSetting:(void (^)(MyViewSizeClass *sbvsc))customSetting
{
    for (UIView *sbv in sbs)
    {
        MyFrame *sbvmyFrame = sbv.myFrame;
        MyViewSizeClass *sbvsc = (MyViewSizeClass *)[sbv myCurrentSizeClassFrom:sbvmyFrame];
        
        
        if (customSetting != nil)
            customSetting(sbvsc);
        
        if (!isEstimate)
            sbvmyFrame.frame = sbv.bounds;
        
        if ([sbv isKindOfClass:[MyBaseLayout class]])
        {
            BOOL isSbvWrap = sbvsc.widthSizeInner.dimeWrapVal || sbvsc.heightSizeInner.dimeWrapVal;
            
            if (pHasSubLayout != nil && isSbvWrap)
                *pHasSubLayout = YES;
            
            if (isEstimate && isSbvWrap)
            {
                [(MyBaseLayout*)sbv sizeThatFits:sbvmyFrame.frame.size inSizeClass:sizeClass];
                //因为sizeThatFits执行后会还原，所以这里要重新设置
                if (sbvmyFrame.multiple)
                    sbvmyFrame.sizeClass = [sbv myBestSizeClass:sizeClass myFrame:sbvmyFrame];
            }
        }
    }
}

@end


@implementation MyBaseLayoutOptionalData


@end


@implementation MyFrame

-(id)init
{
    self = [super init];
    if (self != nil)
    {
        _leading = CGFLOAT_MAX;
        _trailing = CGFLOAT_MAX;
        _top = CGFLOAT_MAX;
        _bottom = CGFLOAT_MAX;
        _width = CGFLOAT_MAX;
        _height = CGFLOAT_MAX;
    }
    
    return self;
}

-(void)reset
{
    _leading = CGFLOAT_MAX;
    _trailing = CGFLOAT_MAX;
    _top = CGFLOAT_MAX;
    _bottom = CGFLOAT_MAX;
    _width = CGFLOAT_MAX;
    _height = CGFLOAT_MAX;
}

-(CGRect)frame
{
    return CGRectMake(_leading, _top,_width, _height);
}

-(void)setFrame:(CGRect)frame
{
    _leading = frame.origin.x;
    _top = frame.origin.y;
    _width  = frame.size.width;
    _height = frame.size.height;
    _trailing = _leading + _width;
    _bottom = _top + _height;
}

-(BOOL)multiple
{
    return self.sizeClasses.count > 1;
}

-(NSString*)description
{
    return [NSString stringWithFormat:@"leading:%g, top:%g, width:%g, height:%g, trailing:%g, bottom:%g",_leading,_top,_width,_height,_trailing,_bottom];
}
@end


@implementation UIWindow (MyLayoutExt)

-(void)myUpdateRTL:(BOOL)isRTL
{
    BOOL oldRTL = [MyBaseLayout isRTL];
    if (oldRTL != isRTL)
    {
        [MyBaseLayout setIsRTL:isRTL];
        [self mySetNeedLayoutAllSubviews:self];
    }
}

-(void)mySetNeedLayoutAllSubviews:(UIView *)v
{
    NSArray *sbs = v.subviews;
    for (UIView *sv in sbs)
    {
        if ([sv isKindOfClass:[MyBaseLayout class]])
            [sv setNeedsLayout];
        
        [self mySetNeedLayoutAllSubviews:sv];
    }
}
@end


#pragma mark -- MyLayoutDragger

@implementation MyLayoutDragger

//开始拖动
-(void)dragView:(UIView *)view withEvent:(UIEvent *)event
{
    if (self.layout == nil)
        return;
    
    self.oldIndex = [self.layout.subviews indexOfObject:view];
    self.currentIndex = self.oldIndex;
    self.hasDragging = NO;
}

//拖动中,在拖动时要排除移动的子视图序列，动画的时长。返回是否拖动成功。
-(void)dragginView:(UIView *)view withEvent:(UIEvent *)event
{
    if (self.layout == nil)
        return;
    
    self.hasDragging = YES;
    
    //取出拖动时当前的位置点。
    CGPoint pt = [[event touchesForView:view].anyObject locationInView:self.layout];
    
    UIView *sbv2 = nil;  //sbv2保存拖动时手指所在的视图。
    //判断当前手指在具体视图的位置。这里要排除self.addButton的位置(因为这个按钮将固定不调整)。
    for (UIView *sbv in self.layout.subviews)
    {
        if (sbv != view && view.useFrame && ![self.exclusiveViews containsObject:sbv])
        {
            CGRect rc1 =  sbv.frame;
            if (CGRectContainsPoint(rc1, pt))
            {
                sbv2 = sbv;
                break;
            }
        }
    }
    
    //如果拖动的控件sender和手指下当前其他的兄弟控件有重合时则意味着需要将当前控件插入到手指下的sbv2所在的位置，并且调整sbv2的位置。
    if (sbv2 != nil)
    {
        if (self.animateDuration > 0)
            [self.layout layoutAnimationWithDuration:self.animateDuration];
        
        //得到要移动的视图的位置索引。
        self.currentIndex = [self.layout.subviews indexOfObjectIdenticalTo:sbv2];
        if (self.oldIndex != self.currentIndex)
        {
            self.oldIndex = self.currentIndex;
        }
        else
        {
            if (!self.canHover)
            {
                if (sbv2.center.x > view.center.x)
                    self.currentIndex = self.oldIndex + 1;
            }
        }
        
        for (NSInteger i = self.layout.subviews.count - 1; i > self.currentIndex; i--)
        {
            [self.layout exchangeSubviewAtIndex:i withSubviewAtIndex:i - 1];
        }
        
        //因为sender在bringSubviewToFront后变为了最后一个子视图，因此要调整正确的位置。
        //经过上面的sbv2的位置调整完成后，需要重新激发布局视图的布局，因此这里要设置autoresizesSubviews为YES。
        self.layout.autoresizesSubviews = YES;
        view.useFrame = NO;
        view.noLayout = YES;
        //这里设置为YES表示布局时不会改变sender的真实位置而只是在布局视图中占用一个位置和尺寸，正是因为只是占用位置，因此会调整其他视图的位置。
        [self.layout layoutIfNeeded];
        
    }
    //在进行sender的位置调整时，要把sender移动到最顶端，也就子视图数组的的最后。同时布局视图不能激发子视图布局，因此要把autoresizesSubviews设置为NO，同时因为要自定义sender的位置，因此要把useFrame设置为YES，并且恢复noLayout为NO。
    [self.layout bringSubviewToFront:view]; //把拖动的子视图放在最后，这样这个子视图在移动时就会在所有兄弟视图的上面。
    self.layout.autoresizesSubviews = NO;  //在拖动时不要让布局视图激发布局
    view.useFrame = YES;  //因为拖动时，拖动的控件需要自己确定位置，不能被布局约束，因此必须要将useFrame设置为YES下面的center设置才会有效。
    view.center = pt;  //因为useFrame设置为了YES所有这里可以直接调整center，从而实现了位置的自定义设置。
    view.noLayout = NO; //恢复noLayout为NO。
}

//结束拖动
-(void)dropView:(UIView *)view withEvent:(UIEvent *)event
{
    if (self.layout == nil)
        return;
    
    if (!self.hasDragging)
        return;
    self.hasDragging = NO;
    
    //当抬起时，需要让拖动的子视图调整到正确的顺序，并重新参与布局，因此这里要把拖动的子视图的useFrame设置为NO，同时把布局视图的autoresizesSubviews还原为YES。
    for (NSInteger i = self.layout.subviews.count - 1; i > self.currentIndex; i--)
    {
        [self.layout exchangeSubviewAtIndex:i withSubviewAtIndex:i - 1];
    }
    
    view.useFrame = NO;  //让拖动的子视图重新参与布局，将useFrame设置为NO
    self.layout.autoresizesSubviews = YES; //让布局视图可以重新激发布局，这里还原为YES。
}

-(BOOL)isHovering
{
    return self.hasDragging && self.canHover && self.oldIndex == self.currentIndex;
}

@end
