

#import "RSBrightnessSlider.h"
#import "RSColorPickerView.h"
#import "ANImageBitmapRep.h"

/**
 * 为背景创建默认的绘制位图.
 */
CGContextRef RSBitmapContextCreateDefault(CGSize size){
	
	size_t width = size.width;
	size_t height = size.height;
	
	size_t bytesPerRow = width * 4;        // 每行的字节argb
	bytesPerRow += (16 - bytesPerRow%16)%16; //确保是16的倍数
	
	CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
	CGContextRef ctx = CGBitmapContextCreate(NULL,         //自动配置
														  width,        //宽度
														  height,       //高度
														  8,            //每个的尺寸
														  bytesPerRow,  //每行的字节大小
														  colorSpace,   //CGColorSpaceRef空间
														  kCGImageAlphaPremultipliedFirst );//CGBitmapInfo对象bitmapInfo
	CGColorSpaceRelease(colorSpace);
	return ctx;
}

/**
 *返回有滑块的、沙漏状的图像，看上去有点像：
 *
 *  6 ______ 5
 *    \    /
 *   7 \  / 4
 *    ->||<--- cWidth (Center Width)
 *      ||
 *   8 /  \ 3
 *    /    \
 *  1 ------ 2
 */
UIImage* RSHourGlassThumbImage(CGSize size, CGFloat cWidth){
	
	//设置大小
	CGFloat width = size.width;
	CGFloat height = size.height;
	
	//设置背景
	CGContextRef ctx = RSBitmapContextCreateDefault(size);
	
	//设置颜色
	CGContextSetFillColorWithColor(ctx, [UIColor blackColor].CGColor);
	CGContextSetStrokeColorWithColor(ctx, [UIColor whiteColor].CGColor);
		
	//绘制滑块，看上面的图的点的个数
	CGFloat yDist83 = sqrtf(3)/2*width;
	CGFloat yDist74 = height - yDist83;
	CGPoint addLines[] = {
		CGPointMake(0, -1),                          //Point 1
		CGPointMake(width, -1),                      //Point 2
		CGPointMake(width/2+cWidth/2, yDist83),      //Point 3
		CGPointMake(width/2+cWidth/2, yDist74),      //Point 4
		CGPointMake(width, height+1),                //Point 5
		CGPointMake(0, height+1),                    //Point 6
		CGPointMake(width/2-cWidth/2, yDist74),      //Point 7
		CGPointMake(width/2-cWidth/2, yDist83)       //Point 8
	};
	//填充路径
	CGContextAddLines(ctx, addLines, sizeof(addLines)/sizeof(addLines[0]));
	CGContextFillPath(ctx);
	
	//笔画路径
	CGContextAddLines(ctx, addLines, sizeof(addLines)/sizeof(addLines[0]));
	CGContextClosePath(ctx);
	CGContextStrokePath(ctx);
	
	CGImageRef cgImage = CGBitmapContextCreateImage(ctx);
	CGContextRelease(ctx);
   
   UIImage* image = [UIImage imageWithCGImage:cgImage]; 
   CGImageRelease(cgImage);
	
	return image;
}

/**
 * 返回的图像下图:
 *
 * +-----+
 * | +-+ | ------------------------
 * | | | |                       |
 * ->| |<--- loopSize.width     loopSize.height
 * | | | |                       |
 * | +-+ | ------------------------
 * +-----+
 */
UIImage* RSArrowLoopThumbImage(CGSize size, CGSize loopSize){
   
   //设置矩形
   CGRect outsideRect = CGRectMake(0, 0, size.width, size.height);
   CGRect insideRect;
   insideRect.size = loopSize;
   insideRect.origin.x = (size.width - loopSize.width)/2;
   insideRect.origin.y = (size.height - loopSize.height)/2;
   
   //设置背景
	CGContextRef ctx = RSBitmapContextCreateDefault(size);
   
   //设置颜色
	CGContextSetFillColorWithColor(ctx, [UIColor blackColor].CGColor);
   CGContextSetStrokeColorWithColor(ctx, [UIColor whiteColor].CGColor);
   
   CGMutablePathRef loopPath = CGPathCreateMutable();
   CGPathAddRect(loopPath, nil, outsideRect);
   CGPathAddRect(loopPath, nil, insideRect);   
   //填充路径
   CGContextAddPath(ctx, loopPath);
   CGContextEOFillPath(ctx);   
   //笔画路径
   CGContextAddRect(ctx, insideRect);
   CGContextStrokePath(ctx);   
   CGImageRef cgImage = CGBitmapContextCreateImage(ctx);
   CGPathRelease(loopPath);
   CGContextRelease(ctx);
   
   UIImage* image = [UIImage imageWithCGImage:cgImage]; 
   CGImageRelease(cgImage);	
	return image;
}
@implementation RSBrightnessSlider

-(id)initWithFrame:(CGRect)frame {
	self = [super initWithFrame:frame];
	if (self) {
		self.minimumValue = 0.0;
		self.maximumValue = 1.0;
		self.continuous = YES;
		
		self.enabled = YES;
		self.userInteractionEnabled = YES;
		
		[self addTarget:self action:@selector(myValueChanged:) forControlEvents:UIControlEventValueChanged];
	}
	return self;
}
-(void)setUseCustomSlider:(BOOL)use {
	if (use) {
		[self setupImages];
	}
}
-(void)myValueChanged:(id)notif {
	[colorPicker setBrightness:self.value];
}
-(void)setupImages {
	ANImageBitmapRep *myRep = [[ANImageBitmapRep alloc] initWithSize:BMPointMake(self.frame.size.width, self.frame.size.height)];
	for (int x = 0; x < myRep.bitmapSize.x; x++) {
		CGFloat percGray = (CGFloat)x / (CGFloat)myRep.bitmapSize.x;
		for (int y = 0; y < myRep.bitmapSize.y; y++) {
			[myRep setPixel:BMPixelMake(percGray, percGray, percGray, 1.0) atPoint:BMPointMake(x, y)];
		}
	}
	[self setMinimumTrackImage:[myRep image] forState:UIControlStateNormal];
	[self setMaximumTrackImage:[myRep image] forState:UIControlStateNormal];
	
	[myRep release];
}
-(void)setColorPicker:(RSColorPickerView*)cp {
	colorPicker = cp;
	if (!colorPicker) { return; }
	self.value = [colorPicker brightness];
}
@end
