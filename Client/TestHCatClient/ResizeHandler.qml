import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.3
import QtQuick.Layouts 1.12
import QtGraphicalEffects 1.0
import Message 1.0
import Chat 1.0
import QtQuick.Dialogs 1.2



Item
{
    id: area

    property var target: undefined;
    property point startPoint: Qt.point(0, 0);
    property point fixedPont: Qt.point(0, 0);

    MouseArea
    {
        id: area1
        x: 0
        y: 0
        width: 8
        height: 8
        hoverEnabled: true

        onEntered: cursorShape = Qt.SizeFDiagCursor;
        onExited: cursorShape = Qt.ArrowCursor;
        onPressed: startPoint = Qt.point(mouseX, mouseY);
        onPositionChanged:
        {
            if(pressed)
            {
                var offsetX = mouse.x - startPoint.x;
                var offsetY = mouse.y - startPoint.y;
                if ((target.width - offsetX) >= target.minimumWidth) //如果本次调整小于最小限制，则调整为最小
                {
                    target.width -= offsetX;
                    target.x += offsetX;
                }
                else
                {
                    target.x += (target.width - target.minimumWidth);
                    target.width -= (target.width - target.minimumWidth);
                }

                if ((target.height - offsetY) >= target.minimumHeight && offsetY != 0)
                {
                    target.height -= offsetY;
                    target.y += offsetY;
                }
            }
        }
    }

    MouseArea
    {
        id: area2
        x: 8
        y: 0
        width: target.width - 16
        height: 8
        hoverEnabled: true

        onEntered: cursorShape = Qt.SizeVerCursor;
        onExited: cursorShape = Qt.ArrowCursor;
        onPressed: startPoint = Qt.point(mouseX, mouseY);
        onPositionChanged:
        {
            if(pressed)
            {
                var offsetY = mouse.y - startPoint.y;
                if ((target.height - offsetY) >= target.minimumHeight && offsetY != 0)
                {
                    target.height -= offsetY;
                    target.y += offsetY;
                }
            }
        }
    }

    MouseArea
    {
        id: area3
        x: target.width - 8
        y: 0
        width: 8
        height: 8
        hoverEnabled: true

        onEntered: cursorShape = Qt.SizeBDiagCursor;
        onExited: cursorShape = Qt.ArrowCursor
        onPressed:
        {
            startPoint = Qt.point(mouseX, mouseY);
            fixedPont = Qt.point(target.x, target.y)
        }
        onPositionChanged:
        {
            if(pressed)
            {
                var offsetX = mouse.x - startPoint.x;
                var offsetY = mouse.y - startPoint.y;
                print (offsetX, offsetY)
                if ((target.width + offsetX) >= target.minimumWidth && offsetX != 0)
                {
                    target.width += offsetX;
                    target.x = fixedPont.x;
                }
                if ((target.height - offsetY) >= target.minimumHeight && offsetY != 0)
                {
                    target.height -= offsetY;
                    target.y += offsetY;
                }
            }
        }
    }

    MouseArea
    {
        id: area4
        x: 0
        y: 8
        width: 8
        height: target.height - 16
        hoverEnabled: true

        onEntered: cursorShape = Qt.SizeHorCursor;
        onExited: cursorShape = Qt.ArrowCursor;
        onPressed:
        {
            startPoint = Qt.point(mouseX, mouseY);
        }
        onPositionChanged:
        {
            if(pressed)
            {
                var offsetX = mouse.x - startPoint.x;
                if ((target.width - offsetX) >= target.minimumWidth)
                {
                    target.width -= offsetX;
                    target.x += offsetX;
                }
            }
        }
    }

    MouseArea
    {
        id: area6
        x: target.width - 8
        y: 8
        width: 8
        height: target.height - 16
        hoverEnabled: true
        property real fixedX: 0;

        onEntered: cursorShape = Qt.SizeHorCursor;
        onExited: cursorShape = Qt.ArrowCursor;
        onPressed:
        {
            startPoint = Qt.point(mouseX, mouseY);
            fixedPont = Qt.point(target.x, target.y)
        }
        onPositionChanged:
        {
            if(pressed)
            {
                var offsetX = mouse.x - startPoint.x;
                if ((target.width + offsetX) >= target.minimumWidth && offsetX != 0)
                {
                    target.width += offsetX;
                    target.x = fixedPont.x;
                }
            }
        }
    }

    MouseArea
    {
        id: area7
        x: 0
        y: target.height - 8
        width: 8
        height: 8//target.height - 16
        hoverEnabled: true
        property real fixedX: 0;

        onEntered: cursorShape = Qt.SizeBDiagCursor;
        onExited: cursorShape = Qt.ArrowCursor;
        onPressed:
        {
            startPoint = Qt.point(mouseX, mouseY);
            fixedPont = Qt.point(target.x, target.y)
        }
        onPositionChanged:
        {
            if (pressed)
            {
                var offsetX = mouse.x - startPoint.x;
                var offsetY = mouse.y - startPoint.y;
                if ((target.width - offsetX) >= target.minimumWidth && offsetX != 0)
                {
                    target.width -= offsetX;
                    target.x += offsetX;
                }
                if ((target.height + offsetY) >= target.minimumHeight && offsetY != 0)
                {
                    target.height += offsetY;
                    target.y = fixedPont.y;
                }
            }
        }
    }

    MouseArea
    {
        id: area8
        x: 8
        y: target.height - 8
        width: target.width - 16
        height: 8
        hoverEnabled: true
        property real fixedX: 0;

        onEntered: cursorShape = Qt.SizeVerCursor;
        onExited: cursorShape = Qt.ArrowCursor;
        onPressed:
        {
            startPoint = Qt.point(mouseX, mouseY);
            fixedPont = Qt.point(target.x, target.y)
        }
        onPositionChanged:
        {
            if (pressed)
            {
                var offsetY = mouse.y - startPoint.y;
                if ((target.height + offsetY) >= target.minimumHeight && offsetY != 0)
                {
                    target.height += offsetY;
                    target.y = fixedPont.y;
                }
            }
        }
    }

    MouseArea
    {
        id: area9
        x: target.width - 8
        y: target.height - 8
        width: 8
        height: 8
        hoverEnabled: true

        onEntered: cursorShape = Qt.SizeFDiagCursor;
        onExited: cursorShape = Qt.ArrowCursor
        onPressed:
        {
            startPoint = Qt.point(mouseX, mouseY)
            fixedPont = Qt.point(target.x, target.y)
        }
        onPositionChanged:
        {
            if(pressed)
            {
                var offsetX = mouse.x - startPoint.x;
                var offsetY = mouse.y - startPoint.y;
                if ((target.width + offsetX) >= target.minimumWidth && offsetX != 0)
                {
                    target.width += offsetX;
                    target.x = fixedPont.x;
                }
                if ((target.height + offsetY) >= target.minimumHeight && offsetY != 0)
                {
                    target.height += offsetY;
                    target.y = fixedPont.y;
                }
            }
        }
    }
}
