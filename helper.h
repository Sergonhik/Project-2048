#ifndef HELPER_H
#define HELPER_H

#include <QObject>
#include <QVector>
class Helper : public QObject
{
    Q_OBJECT
public:
    explicit Helper(QObject *parent = nullptr);

signals:
public slots:
    QVector<int> newGame();
    QVector<int> goleft(QVector<int>bricks);
    QVector<int> goright(QVector<int>bricks);
    QVector<int> sprnd(QVector<int>bricks);
    QVector<int> gotop(QVector<int>bricks);
    QVector<int> gobottom(QVector<int>bricks);

};

#endif // HELPER_H
