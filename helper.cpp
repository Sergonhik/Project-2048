#include "helper.h"
#include <QDebug>
Helper::Helper(QObject *parent) : QObject(parent)
{

}

QVector<int> Helper::newGame(){
    int p1 = rand() % (24 - 0 + 1) + 0;
    int p2 = rand() % (24 - 0 + 1) + 0;
    QVector<int> bricks = {
        0,0,0,0,0,
        0,0,0,0,0,
        0,0,0,0,0,
        0,0,0,0,0,
        0,0,0,0,0
    };
    bricks[p1] = 2;
    while (p1==p2)
        p2 = rand() % (24 - 0 + 1) + 0;
    bricks[p2] = 2;
    return bricks;
}
QVector<int> Helper::sprnd(QVector<int>bricks){
    int k=0;
    for(int i = 0; i<bricks.length(); i++){
        if (bricks[i]==0)
            k+=1;
    }
    if (k<2){
        QVector<int> vect= {-999};
        return vect;
    }
    int p1;
    int x=0;
    for(int i = 0; i<bricks.length(); i++){
        if (bricks[i]==0){
            p1 = rand() % (1 - 0 + 1) + 0;
            if(p1==1){
                bricks[i]=2;
                x+=1;
            }
            if(x==2)
                break;
        }
    }
    return bricks;
}
QVector<int> Helper::goleft(QVector<int>bricks){
    QVector<int> newBricks;
    QVector<int> tempLine;
    int k=-1;
    for(int i = 0; i<bricks.length(); i++){
        if (bricks[i]!=0){
            k+=1;
            if(k>0 and tempLine[k-1]==bricks[i]){
                tempLine[k-1] = tempLine[k-1]*2;
                k-=1;
            }
            else
                tempLine.push_back(bricks[i]);
        }
        if (i%10==4 or i%10==9){
            for (int x = 0; x<=k; x++)
                newBricks.push_back(tempLine[x]);
            for (int x = 0; x<(5-(k+1)); x++)
                newBricks.push_back(0);
            tempLine.clear();
            k=-1;
        }
    }
    return newBricks;
}
QVector<int> Helper::goright(QVector<int>bricks){
    QVector<int> newBricks;
    QVector<int> tempLine;
    int k=-1;
    for(int i = 0; i<bricks.length(); i++){
        if (bricks[i]!=0){
            k+=1;
            if(k>0 and tempLine[k-1]==bricks[i]){
                tempLine[k-1] = tempLine[k-1]*2;
                k-=1;
            }
            else
                tempLine.push_back(bricks[i]);
        }
        if (i%10==4 or i%10==9){
            QVector<int> revtempLine;
            for (int x = 0; x<=k; x++){
                revtempLine.push_front(tempLine[x]);
            }
            tempLine = revtempLine;
            for (int x = 0; x<(5-(k+1)); x++)
                newBricks.push_back(0);
            for (int x = k; x>=0; x--){
                newBricks.push_back(revtempLine[x]);
            }
            tempLine.clear();
            k=-1;
        }
    }
    return newBricks;
}
QVector<int> Helper::gotop(QVector<int>bricks){
    QVector<int> newBricks = bricks;
    QVector<int> tempLine;
    int k=-1;
    for(int i = 0; i<5; i++){
        k=-1;
        for(int x=0;x<bricks.length();x++){
            if ((i==(x%10) or i==(x%10)-5) and bricks[x]!=0){
                if (k>-1 and bricks[x]==tempLine[k]){
                    tempLine[k] = tempLine[k]*2;
                    newBricks[x] = 0;
                }
                else{
                    tempLine.push_back(bricks[x]);
                    newBricks[x] = 0;
                    k+=1;
                }
            }
        }
        int j=0;
        for(int x=0;x<bricks.length();x++){
            if (i==(x%10) or i==(x%10)-5){
                if (k==-1)
                    newBricks[x]=0;
                else{
                    newBricks[x]=tempLine[j];
                    j+=1;
                    k-=1;
                }
            }
        }
        tempLine.clear();
    }
    return newBricks;
}
QVector<int> Helper::gobottom(QVector<int>bricks){
    QVector<int> newBricks = bricks;
    QVector<int> tempLine;
    int k=-1;
    for(int i = 0; i<5; i++){
        k=-1;
        for(int x=24;x>=0;x--){
            if ((i==(x%10) or i==(x%10)-5) and bricks[x]!=0){
                if (k>-1 and bricks[x]==tempLine[k]){
                    tempLine[k] = tempLine[k]*2;
                    newBricks[x] = 0;
                }
                else{
                    tempLine.push_back(bricks[x]);
                    newBricks[x] = 0;
                    k+=1;
                }
            }
        }
        int j=0;
        for(int x=24;x>=0;x--){
            if (i==(x%10) or i==(x%10)-5){
                if (k==-1)
                    newBricks[x]=0;
                else{
                    newBricks[x]=tempLine[j];
                    j+=1;
                    k-=1;
                }
            }
        }
        tempLine.clear();
    }
    return newBricks;
}
