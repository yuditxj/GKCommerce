//
//  GKResizer.h
//  Resize
//
//  Created by 小悟空 on 1/11/15.
//  Copyright (c) 2015 小悟空. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
  GKNorthWest, GKNorth, GKNorthEast, GKWest, GKCenter, GKEast, GKSouthWest,
  GKSouth, GKSouthEast
} GKGravity;

// TODO: 新增设置Gravity

@interface GKResizer : NSObject
@property (strong, nonatomic) NSURL *original;
@property (assign, nonatomic) float width;
@property (assign, nonatomic) float height;
@property (assign, nonatomic) float angle;
@property (assign, nonatomic) float quality;
@property (assign, nonatomic) float scaleWidth;
@property (assign, nonatomic) float scaleHeight;
@property (assign, nonatomic) float x;
@property (assign, nonatomic) float y;
@property (assign, nonatomic) BOOL isGray;
@property (assign, nonatomic) BOOL isCrop;
@property (assign, nonatomic) BOOL isCropAndFill;
@property (strong, nonatomic) NSString *extension;
- (id)initWithURL:(NSURL *)url;
- (id)initWithString:(NSString *)url;
- (GKResizer *)width:(float)width;
- (GKResizer *)height:(float)height;
- (GKResizer *)gray;
- (GKResizer *)rotate:(float)angle;
- (GKResizer *)quality:(float)number;
- (GKResizer *)png;
- (GKResizer *)jpg;
- (GKResizer *)xbm;
- (GKResizer *)gif;
- (GKResizer *)scale:(float)percent;
- (GKResizer *)crop:(float)widthAndHeight;
- (GKResizer *)crop:(float)width height:(float)aHeight;
- (GKResizer *)x:(float)x;
- (GKResizer *)y:(float)y;
- (GKResizer *)cropAndFill;
- (UIImage *)image;
- (NSURL *)url;
+ (instancetype)resizerWithURL:(NSURL *)url;
+ (instancetype)resizerWithString:(NSString *)url;
@end
