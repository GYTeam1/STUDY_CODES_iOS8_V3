

#import "TestView.h"

@implementation TestView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // 初始化代码
        self.backgroundColor = [UIColor whiteColor];
        pointArray = [[NSMutableArray alloc]initWithCapacity:3];
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 320, 40)];
        label.text = @"任意点击屏幕内的三点以确定一个三角形";
        [self addSubview:label];
        [label release];
    }
    return self;
}

//如果执行了自定义绘制，则只覆盖drawrect：。

//一个空的实现产生不利的影响会表现在动画。
- (void)drawRect:(CGRect)rect
{
    // 绘制代码
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetRGBStrokeColor(context, 0.5, 0.5, 0.5, 1.0);
	// 绘制更加明显的线条
	CGContextSetLineWidth(context, 2.0);
	
	// 画一条连接起来的线条
	CGPoint addLines[] =
	{
        firstPoint,secondPoint,thirdPoint,firstPoint,
	};
	CGContextAddLines(context, addLines, sizeof(addLines)/sizeof(addLines[0]));
	CGContextStrokePath(context);

}
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
}
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
}
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch * touch = [touches anyObject]; 
    CGPoint point = [touch locationInView:self];
    [pointArray addObject:[NSValue valueWithCGPoint:point]];
    if (pointArray.count > 3) {
        [pointArray removeObjectAtIndex:0];
    }
    if (pointArray.count==3) {
        firstPoint = [[pointArray objectAtIndex:0]CGPointValue];
        secondPoint = [[pointArray objectAtIndex:1]CGPointValue];
        thirdPoint = [[pointArray objectAtIndex:2]CGPointValue];
    }
    NSLog(@"%@",[NSString stringWithFormat:@"1:%f/%f\n2:%f/%f\n3:%f/%f",firstPoint.x,firstPoint.y,secondPoint.x,secondPoint.y,thirdPoint.x,thirdPoint.y]);
    [self setNeedsDisplay];
}
-(void)dealloc{
    [pointArray release];
    [super dealloc];
}

@end
