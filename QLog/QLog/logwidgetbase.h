/******************************************************************************
* @文件名     logwidgetbase.h
* @功能      日志显示窗口父类(接口类)
* @开发者     mhf
* @时间      2021/11/20
* @备注
*****************************************************************************/
#ifndef LOGWIDGETBASE_H
#define LOGWIDGETBASE_H

#include <QWidget>
#include <qdatetime.h>

class LogWidgetBase : public QWidget
{
    Q_OBJECT
public:
    explicit LogWidgetBase(QWidget *parent = nullptr);

protected:
    virtual void on_logData(QtMsgType type, QTime time, QString file, QString function, int line, QString msg) = 0;
    /**
     * @brief            设置日志最多显示行数
     * @param maximum
     */
    virtual void setMaxMumBlockCount(int maximum) = 0;


signals:

};

#endif // LOGWIDGETBASE_H
