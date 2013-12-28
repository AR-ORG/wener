ѧ������ϵͳ
===========

��ҵɶ��~~

һЩ�õ��ļ���
============

�ô��ڿ��϶�
----------

����д��WndProc,�����Ǵ�ͳ������¼�

```C#

// Let Windows drag this form for us
protected override void WndProc(ref Message m)
{
	if (m.Msg == 0x0084 /*WM_NCHITTEST*/)
	{
		m.Result = (IntPtr)2;	// HTCLIENT
		return;
	}
	base.WndProc(ref m);
}

```

��ͳ�汾

```C#
// In form load

var lastPoint = new Point();
var _isDraging = false;
MouseDown += (sender, e) =>
{
	_isDraging = true;
	lastPoint = e.Location;
};
MouseMove += (sender, e) =>
{
	if (! _isDraging)
		return;

	int ox = e.X - lastPoint.X;
	int oy = e.Y - lastPoint.Y;
	Location = new Point(Location.X + ox, Location.Y + oy);
};
MouseUp += (sender, e) => { _isDraging = false; };

```

ʵ�����ƵĴ�����Ӱ
----------------

��ʹ�õ�һ���� `Dropshadow`.

�ʼ��[����](http://stackoverflow.com/questions/8793445/windows-7-style-dropshadow-in-borderless-form)
������ʵ����Ӱ�ķ���,�����в����˺ܶණ��,�޸ĳ���
���Լ��� `Dropshadow` �汾.���÷���

```C#
var f = new Dropshadow(this)
{
	BorderRadius = 40,
	ShadowColor = Color.Blue
};

f.RefreshShadow();
```

�� DataGridView ��ʹ�� DateTimePicker
-------------------------------------

��������˾������������ҵ���,ʹ�� `CalendarColumn` 
�� `CalendarCell` ����.�����ʱ����ֱ��ѡ��.

Բ�Ǳ߿�
----------

```C#
[DllImport("Gdi32.dll", EntryPoint = "CreateRoundRectRgn")]
public static extern IntPtr CreateRoundRectRgn
	(
	int nLeftRect, // x-coordinate of upper-left corner
	int nTopRect, // y-coordinate of upper-left corner
	int nRightRect, // x-coordinate of lower-right corner
	int nBottomRect, // y-coordinate of lower-right corner
	int nWidthEllipse, // height of ellipse
	int nHeightEllipse // width of ellipse
	);

// in form load
Region = Region.FromHrgn(Win32.CreateRoundRectRgn(0, 0, Width, Height, 20, 20));
	
```