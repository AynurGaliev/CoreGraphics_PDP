/*
 
 Erica Sadun, http://ericasadun.com
 
 */

#import "BaseGeometry.h"

CGPoint RectGetCenter(CGRect rect)
{
    return CGPointMake(CGRectGetMidX(rect), CGRectGetMidY(rect));
}
