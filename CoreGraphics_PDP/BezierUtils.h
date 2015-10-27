/*
 
 Erica Sadun, http://ericasadun.com
 
 */

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>
#import <UIKit/UIKit.h>

CGRect PathBoundingBox(UIBezierPath *path);

CGPoint PathBoundingCenter(UIBezierPath *path);

void ApplyCenteredPathTransform(UIBezierPath *path, CGAffineTransform transform);

void OffsetPath(UIBezierPath *path, CGSize offset);

UIBezierPath *BezierPathFromString(NSString *string, UIFont *font);

void MirrorPathVertically(UIBezierPath *path);

