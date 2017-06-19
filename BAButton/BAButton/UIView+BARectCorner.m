//
//  UIView+BARectCorner.m
//  BAButton
//
//  Created by boai on 2017/5/19.
//  Copyright © 2017年 boai. All rights reserved.
//

#import "UIView+BARectCorner.h"
#import "BAKit_ConfigurationDefine.h"

@implementation UIView (BARectCorner)

- (void)ba_view_setViewRectCornerType:(BAKit_ViewRectCornerType)type viewCornerRadius:(CGFloat)viewCornerRadius
{
    self.ba_viewCornerRadius = viewCornerRadius;
    self.ba_viewRectCornerType = type;
}

#pragma mark - view 的 角半径，默认 CGSizeMake(0, 0)
- (void)setupButtonCornerType
{
    UIRectCorner corners;
    CGSize cornerRadii;
    
    cornerRadii = CGSizeMake(self.ba_viewCornerRadius, self.ba_viewCornerRadius);
    if (self.ba_viewCornerRadius == 0)
    {
        cornerRadii = CGSizeMake(0, 0);
    }
    
    switch (self.ba_viewRectCornerType)
    {
        case BAKit_ViewRectCornerTypeBottomLeft:
        {
            corners = UIRectCornerBottomLeft;
        }
            break;
        case BAKit_ViewRectCornerTypeBottomRight:
        {
            corners = UIRectCornerBottomRight;
        }
            break;
        case BAKit_ViewRectCornerTypeTopLeft:
        {
            corners = UIRectCornerTopLeft;
        }
            break;
        case BAKit_ViewRectCornerTypeTopRight:
        {
            corners = UIRectCornerTopRight;
        }
            break;
        case BAKit_ViewRectCornerTypeBottomLeftAndBottomRight:
        {
            corners = UIRectCornerBottomLeft | UIRectCornerBottomRight;
        }
            break;
        case BAKit_ViewRectCornerTypeTopLeftAndTopRight:
        {
            corners = UIRectCornerTopLeft | UIRectCornerTopRight;
        }
            break;
        case BAKit_ViewRectCornerTypeBottomLeftAndTopLeft:
        {
            corners = UIRectCornerBottomLeft | UIRectCornerTopLeft;
        }
            break;
        case BAKit_ViewRectCornerTypeBottomRightAndTopRight:
        {
            corners = UIRectCornerBottomRight | UIRectCornerTopRight;
        }
            break;
        case BAKit_ViewRectCornerTypeBottomRightAndTopRightAndTopLeft:
        {
            corners = UIRectCornerBottomRight | UIRectCornerTopRight | UIRectCornerTopLeft;
        }
            break;
        case BAKit_ViewRectCornerTypeBottomRightAndTopRightAndBottomLeft:
        {
            corners = UIRectCornerBottomRight | UIRectCornerTopRight | UIRectCornerBottomLeft;
        }
            break;
        case BAKit_ViewRectCornerTypeAllCorners:
        {
            corners = UIRectCornerAllCorners;
        }
            break;
            
        default:
            break;
    }
    
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds
                                                   byRoundingCorners:corners
                                                         cornerRadii:cornerRadii];
    CAShapeLayer *maskLayer = [CAShapeLayer layer];
    maskLayer.frame         = self.bounds;
    maskLayer.path          = maskPath.CGPath;
    self.layer.mask         = maskLayer;
}

#pragma mark - setter / getter
- (void)setBa_viewRectCornerType:(BAKit_ViewRectCornerType)ba_viewRectCornerType
{
    BAKit_Objc_setObj(@selector(ba_viewRectCornerType), @(ba_viewRectCornerType));
    [self setupButtonCornerType];
}

- (BAKit_ViewRectCornerType)ba_viewRectCornerType
{
    return [BAKit_Objc_getObj integerValue];
}

- (void)setBa_viewCornerRadius:(CGFloat)ba_viewCornerRadius
{
    BAKit_Objc_setObj(@selector(ba_viewCornerRadius), @(ba_viewCornerRadius));
}

- (CGFloat)ba_viewCornerRadius
{
    return [BAKit_Objc_getObj integerValue];
}

@end
